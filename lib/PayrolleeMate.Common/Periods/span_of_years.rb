module Payrollee_Common

  class SpanOfYears
    def self.create_from_year(year)
        SpanOfYears.new(year, year)
    end

    def self.create_from_year_to_year(from, upto)
        SpanOfYears.new(from, upto)
    end

    attr_reader :year_from
    attr_reader :year_upto

    def initialize (from, upto)
        @year_from = from
        @year_upto = upto
    end

    def is_equal_to_interval(other)
        (@year_from == other.year_from && @year_upto == other.year_upto)
    end

    def ==(other)
      is_equal_to_interval(other)
    end

    def <=>(other)
      if @year_from != other.year_from
        return @year_from<=>(other.year_from)
      end

      @year_upto<=>(other.year_upto)
    end

    def <(other)
      if @year_from != other.year_from
        return @year_from<=>(other.year_from)
      end

      @year_upto<=>(other.year_upto)
    end

    def >(other)
      if @year_from != other.year_from
        return @year_from<=>(other.year_from)
      end

      @year_upto<=>(other.year_upto)
    end

    def eql?(other)
      is_equal_to_interval(other)
    end

    def hash
      result = @year_from.hash

      result ^ @year_upto.hash
    end

    def class_name
      class_name = @year_from.to_s

      if year_from != year_upto
         class_name += "to#{@year_upto.to_s}"
      end
      class_name
    end

    def to_s
      class_name
    end
  end
end