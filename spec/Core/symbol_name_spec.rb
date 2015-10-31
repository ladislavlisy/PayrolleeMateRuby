require 'rspec'
require_relative('../../lib/PayrolleeMate')

include Payrollee_Common

describe 'TestSymbolName' do

  test_symbol_code1001 = 1001
  test_symbol_code2001 = 2001
  test_symbol_code3001 = 3001
  test_symbol_code4001 = 4001
  test_symbol_code5001 = 5001

  it 'should Should_Compare_Different_Symbols_AsEqual' do
    test_symbol_one = SymbolName.new(test_symbol_code1001, 'Begining Symbol');
    test_symbol_two = SymbolName.new(test_symbol_code1001, 'Terminal Symbol');

    expect(test_symbol_one).to eq(test_symbol_two)
  end

  it 'should Should_Compare_Different_Symbols_AsGreater' do
    test_symbol_one = SymbolName.new(test_symbol_code1001, 'Begining Symbol');
    test_symbol_two = SymbolName.new(test_symbol_code5001, 'Terminal Symbol');

    expect(test_symbol_two).not_to eq(test_symbol_one)
    expect(test_symbol_two > test_symbol_one).to be_truthy
  end

  it 'should Should_Compare_Different_Symbols_AsLess' do
    test_symbol_one = SymbolName.new(test_symbol_code1001, 'Begining Symbol');
    test_symbol_two = SymbolName.new(test_symbol_code5001, 'Terminal Symbol');

    expect(test_symbol_one).not_to eq(test_symbol_two)
    expect(test_symbol_one < test_symbol_two).to be_truthy
  end

end