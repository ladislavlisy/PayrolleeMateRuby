require 'rspec'
require_relative('../../lib/PayrolleeMate')

include Payrollee_Common

describe 'TestSpanOfYears' do

  it 'Should_Return_IntervalName_2013' do
    test_interval = SpanOfYears.new(2013,2013)
    test_name = test_interval.class_name
    expect('2013').to eq(test_name)
  end

  it 'Should_Return_IntervalName_2011to2013' do
    test_interval = SpanOfYears.create_from_year_to_year(2011,2013)
    test_name = test_interval.class_name
    expect('2011to2013').to eq(test_name)
  end

  it 'Should_Return_IntervalArray_2011_2015' do
    test_change_years = [2011,2012,2014,2016,2017,0]

    test_span_years = SeqOfYears.new (test_change_years)

    exps_year_array = [
        SpanOfYears.new(2011, 2011),
        SpanOfYears.new(2012, 2013),
        SpanOfYears.new(2014, 2015),
        SpanOfYears.new(2016, 2016),
        SpanOfYears.new(2017, 2099)
    ]
    test_year_array = test_span_years.years_interval_array

    expect(exps_year_array).to eq(test_year_array)
  end

  it 'Should_Return_Interval_2011_For_Period_2011' do
    test_change_years = [2011,2012,2014,2016,2017,0]

    test_year_array = SeqOfYears.new (test_change_years)

    test_period = MonthPeriod.create_form_year_month(2011, 1)
    exps_interval = SpanOfYears.new(2011, 2011)
    test_interval = test_year_array.years_interval_for_period (test_period)
    expect(exps_interval).to eq(test_interval)
  end

  it 'Should_Return_Interval_2016_For_Period_2016' do
    test_change_years = [2011,2012,2014,2016,2017,0]

    test_year_array = SeqOfYears.new (test_change_years)

    test_period = MonthPeriod.create_form_year_month(2016, 1)
    exps_interval = SpanOfYears.new(2016, 2016)
    test_interval = test_year_array.years_interval_for_period (test_period)
    expect(exps_interval).to eq(test_interval)
  end

  it 'Should_Return_Interval_2012to2013_For_Period_2013' do
    test_change_years = [2011,2012,2014,2016,2017,0]

    test_year_array = SeqOfYears.new (test_change_years)

    test_period = MonthPeriod.create_form_year_month(2013, 1)
    exps_interval = SpanOfYears.new(2012, 2013)
    test_interval = test_year_array.years_interval_for_period (test_period)
    expect(exps_interval).to eq(test_interval)
  end

  it 'Should_Return_Interval_2017to2099_For_Period_2018' do
    test_change_years = [2011,2012,2014,2016,2017,0]

    test_year_array = SeqOfYears.new (test_change_years)

    test_period = MonthPeriod.create_form_year_month(2018, 1)
    exps_interval = SpanOfYears.new(2017, 2099)
    test_interval = test_year_array.years_interval_for_period (test_period)
    expect(exps_interval).to eq(test_interval)
  end
end