require 'rspec'
require_relative('../../lib/PayrolleeMate')

include Payrollee_Common

describe 'TestMonthPeriod' do

  test_period_code_Jan = 201401
  test_period_code_Feb = 201402
  test_period_code_501 = 201501
  test_period_code_402 = 201402

  it 'should Compare_Different_Periods_AsEqual_When_2014_01' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    test_period_two = MonthPeriod.new (test_period_code_Jan)

    expect(test_period_one).to eq(test_period_two)
  end

  it 'should Compare_Different_Periods_AsEqual_When_2014_02' do
    test_period_one = MonthPeriod.new (test_period_code_Feb)

    test_period_two = MonthPeriod.new (test_period_code_Feb)

    expect(test_period_one).to eq(test_period_two)
  end

  it 'should Compare_Different_Periods_SameYear_AsGreater' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    test_period_two = MonthPeriod.new (test_period_code_Feb)

    expect(test_period_two).not_to eq(test_period_one)
    expect(test_period_two > test_period_one).to be_truthy
  end

  it 'should Compare_Different_Periods_SameYear_AsLess' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    test_period_two = MonthPeriod.new (test_period_code_Feb)

    expect(test_period_one).not_to eq(test_period_two)
    expect(test_period_one < test_period_two).to be_truthy
  end

  it 'should Compare_Different_Periods_SameMonth_AsGreater' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    test_period_two = MonthPeriod.new (test_period_code_Feb)

    expect(test_period_two).not_to eql(test_period_one)
    expect(test_period_two > test_period_one).to be_truthy
  end

  it 'should Compare_Different_Periods_SameMonth_AsLess' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    test_period_two = MonthPeriod.new (test_period_code_Feb)

    expect(test_period_one).not_to eq(test_period_two)
    expect(test_period_one < test_period_two).to be_truthy
  end

  it 'should Compare_Different_Periods_DifferentYear_AsGreater' do
    test_period_one = MonthPeriod.new (test_period_code_402)

    test_period_two = MonthPeriod.new (test_period_code_501)

    expect(test_period_two).not_to eq(test_period_one)
    expect(test_period_two > test_period_one).to be_truthy
  end

  it 'should Compare_Different_Periods_DifferentYear_AsLess' do
    test_period_one = MonthPeriod.new (test_period_code_402)

    test_period_two = MonthPeriod.new (test_period_code_501)

    expect(test_period_one).not_to eq(test_period_two)
    expect(test_period_one < test_period_two).to be_truthy
  end

  it 'should Return_Periods_Year_And_Month_2014_01' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    expect(2014).to eq(test_period_one.year)
    expect(1).to eq(test_period_one.month)
    expect(2014).to eq(test_period_one.year_int)
    expect(1).to eq(test_period_one.month_int)
  end

  it 'should Return_Periods_Year_And_Month_2014_02' do
    test_period_one = MonthPeriod.new (test_period_code_Feb)

    expect(2014).to eq(test_period_one.year)
    expect(2).to eq(test_period_one.month)
    expect(2014).to eq(test_period_one.year_int)
    expect(2).to eq(test_period_one.month_int)
  end

  it 'should Return_Periods_Month_And_Year_Descriptions' do
    test_period_jan = MonthPeriod.new (test_period_code_Jan)
    test_period_feb = MonthPeriod.new (test_period_code_Feb)
    test_period_501 = MonthPeriod.new (test_period_code_501)
    test_period_402 = MonthPeriod.new (test_period_code_402)

    expect(test_period_jan.description).to eq('January 2014')
    expect(test_period_feb.description).to eq('February 2014')
    expect(test_period_501.description).to eq('January 2015')
    expect(test_period_402.description).to eq('February 2014')
  end
end