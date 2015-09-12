module Payrollee_Common

  class SpanOfMonths
    def self.create_from_year(year)
      SpanOfYears.new(MonthPeriod::begin_year(year), MonthPeriod::end_year(year))
    end

    def self.create_from_month(period)
      SpanOfYears.new(period, period)
    end

    attr_reader :period_from
    attr_reader :period_upto

    def initialize (from, upto)
      @period_from = from
      @period_upto = upto
    end

    def is_equal_to_interval(other)
      (@period_from == other.period_from && @period_upto == other.period_upto)
    end

    def ==(other)
      is_equal_to_interval(other)
    end

    def <=>(other)
      if @period_from != other.period_from
        return @period_from<=>(other.period_from)
      end

      @period_upto<=>(other.period_upto)
    end

    def <(other)
      if @period_from != other.period_from
        return @period_from<=>(other.period_from)
      end

      @period_upto<=>(other.period_upto)
    end

    def >(other)
      if @period_from != other.period_from
        return @period_from<=>(other.period_from)
      end

      @period_upto<=>(other.period_upto)
    end

    def eql?(other)
      is_equal_to_interval(other)
    end

    def hash
      prime = 31
      result = super.hash

      result += prime * result + @period_from.hash

      result += prime * result + @period_upto.hash

      result
    end

    def class_name
      class_name = @period_from.to_s

      if year_from != period_upto
        class_name += "to#{@period_upto.to_s}"
      end
      class_name
    end

    def to_s
      class_name
    end

  end
end