module Payrollee_Common

  class SeqOfYears
    END_YEAR_ARRAY = 2100
    END_YEAR_INTER = 2099

    def self.order_years(year1, year2)
      comp_year1 = (year1==0 ? END_YEAR_ARRAY : year1)
      comp_year2 = (year2==0 ? END_YEAR_ARRAY : year2)
      comp_year1<=>comp_year2
    end

    def initialize(years)
        @milestones = years.sort {|a,b| SeqOfYears.order_years(a,b)}
    end

    def aggregate_for_period(agr, x, period)
      int_from = agr.year_from
      int_upto = agr.year_upto
      int_year = x

      if int_year == 0
        int_year = END_YEAR_ARRAY
      end

      if period.year >= int_year
        int_from = int_year
      end

      if period.year < int_year && int_upto == 0
         int_upto = (int_year-1)
      end

      SpanOfYears.new(int_from, int_upto)
    end

    def years_interval_for_period(period)
      valid_span = @milestones.inject (SpanOfYears.new(0,0)) { |agr, x| aggregate_for_period(agr, x, period) }
    end

    def aggregate_to_array(agr, x)
      first_part = agr.select {|x| x.year_upto != 0}

      if agr.length == 0
        first_part.concat( [SpanOfYears.new(x, 0)] )
      else
        last_part = agr.last

        if x == 0
          history_from = last_part.year_from
          history_upto = END_YEAR_INTER

          first_part.concat( [SpanOfYears.new(history_from, history_upto)] )
        else
          history_from = last_part.year_from
          history_upto = [x-1, history_from].max

          first_part.concat( [SpanOfYears.new(history_from, history_upto),SpanOfYears.new(x, 0)])
        end
      end
    end

    def to_years_interval_array
      history = @milestones.inject([]) { |agr, x|  aggregate_to_array(agr, x)}

      last_part = history.last

      if last_part.year_upto == 0
        first_part = history.select {|x| x.year_upto != 0}

        history_from = last_part.year_from
        history_upto = last_part.year_from

        first_part.concat( [SpanOfYears.new(history_from, history_upto)] )
        return first_part
      end
      history
    end
  end

end