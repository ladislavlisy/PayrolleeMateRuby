module Payrollee_Common

  class SeqOfYears
    END_YEAR_ARRAY = 2100
    END_YEAR_INTER = 2099

    def self.transform_zero_to_upto(year_upto)
      year_upto == 0 ? END_YEAR_ARRAY : year_upto
    end

    def self.transform_years_to_spans(year_from, year_upto)
      span_upto = SeqOfYears.transform_zero_to_upto(year_upto)
      SpanOfYears.new(year_from, span_upto == year_from ? span_upto : span_upto - 1)
    end

    def self.order_years(year1, year2)
      comp_year1 = SeqOfYears.transform_zero_to_upto(year1)
      comp_year2 = SeqOfYears.transform_zero_to_upto(year2)
      comp_year1<=>comp_year2
    end

    def initialize(years)
      sorted_years = years.sort {|a,b| SeqOfYears.order_years(a,b)}
      begins_years = sorted_years.select {|x| x != 0}
      finish_years = sorted_years.slice(1, sorted_years.length)
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

    def to_years_interval_array
      @milestones.dup
    end
  end

end