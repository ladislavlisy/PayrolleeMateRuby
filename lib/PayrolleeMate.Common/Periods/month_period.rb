require 'date'

module Payrollee_Common

  class MonthPeriod
    PRESENT = 0

    attr_reader :code

    def self.empty
      MonthPeriod.new(PRESENT)
    end

    def self.create_form_year_month(year, month)
      MonthPeriod.new(year*100 + month)
    end

    def self.begin_year(year)
      MonthPeriod.new(year*100 + 1)
    end

    def self.end_year(year)
      MonthPeriod.new(year*100 + 12)
    end

    def initialize(code)
      @code = code
    end

    def ==(other)
      @code == other.code
    end

    def <=>(other)
      @code <=> other.code
    end

    def <(other)
      @code < other.code
    end

    def >(other)
      @code > other.code
    end

    def eql?(other)
      @code == other.code
    end

    def hash
      code_int = @code.hash
    end

    def year
      (@code / 100)
    end

    def month
      (@code % 100)
    end

    def year_int
      (@code / 100)
    end

    def month_int
      (@code % 100)
    end

    def month_order
      Math.max(0, year_int - 2000) * 12 + month_int
    end

    def days_in_month
       Time.days_in_month(month_int, year_int)
    end

    def begin_of_month
      Date.new(year_int, month_int, 1)
    end

    def end_of_month
      Date.new(year_int, month_int, days_in_month)
    end

    def date_of_month(day_ordinal)
      period_day = [[1, day_ordinal].max, days_in_month].min

      Date.new(year_int, month_int, period_day)
    end

    def week_day_of_month(day_ordinal)
      period_date = date_of_month(day_ordinal)

      day_of_week_mon_to_sun(period_date)
    end

    def day_of_week_mon_to_sun(date_period)
      # cwday Sunday = 0
      # Monday = 1, Tuesday = 2, Wednesday = 3, Thursday = 4, Friday = 5, Saturday = 6

      period_date_cwd = date_period.cwday

      return 7 if period_date_cwd == 0

      period_date_cwd
    end

    def description
      first_period_day = begin_of_month

      first_period_day.strftime('%B %Y')
    end

    def is_equal_to_period(other)
      @code == other.code
    end

    def to_s
      @code.to_s
    end

  end

end
