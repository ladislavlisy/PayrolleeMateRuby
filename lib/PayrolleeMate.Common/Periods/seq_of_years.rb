module Payrollee_Common

  class SeqOfYears
    END_YEAR_ARRAY = 2100
    END_YEAR_INTER = 2099

    def self.transform_zero_to_upto(year_upto)
      year_upto == 0 ? END_YEAR_ARRAY : year_upto
    end

    def self.order_years(year1, year2)
      comp_year1 = SeqOfYears.transform_zero_to_upto(year1)
      comp_year2 = SeqOfYears.transform_zero_to_upto(year2)
      comp_year1<=>comp_year2
    end

    def self.transform_years_to_spans(year_from, year_upto)
      tran_upto = SeqOfYears.transform_zero_to_upto(year_upto)
      span_upto = (tran_upto == year_from ? tran_upto : tran_upto - 1)
      SpanOfYears.new(year_from, span_upto)
    end

    def initialize(years)
      sorted_years = years.sort {|a,b| SeqOfYears.order_years(a,b)}
      begins_count = [0, sorted_years.length-1].max
      begins_years = sorted_years.slice(0, begins_count)
      finish_count = [0, sorted_years.length-1].max
      finish_years = sorted_years.slice(1, finish_count)
      sorted_ziped = begins_years.zip(finish_years)
      @milestones = sorted_ziped.map {|x| SeqOfYears.transform_years_to_spans(x.first, x.last)}
    end

    def select_for_period(span, period)
      period.year >= span.year_from && period.year <= span.year_upto
    end

    def years_interval_for_period(period)
      valid_span = @milestones.select { |span| select_for_period(span, period) }
      valid_span.first || SpanOfYears.create_from_year(0)
    end

    def years_interval_array
      @milestones.dup
    end
  end

end