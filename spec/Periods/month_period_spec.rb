require 'rspec'
require '../lib/PayrolleeMate'

include Payrollee_Common

describe 'TestMonthPeriod' do

  test_period_code_Jan = 201401
  test_period_code_Feb = 201402
  test_period_code_501 = 201501
  test_period_code_402 = 201402

  it 'should compare_different_periods_as_equal_when_2014_01' do
    test_period_one = MonthPeriod.new (test_period_code_Jan)

    test_period_two = MonthPeriod.new (test_period_code_Jan)

    expect(test_period_one).to eq(test_period_two)
  end
end