require 'spec_helper'
require_relative '../calculator.rb'

describe "1. Initialize calculator with initial value" do

  it 'should create an instance of calculator with starting value equaling 1' do
    calc = Calculator.new(1)
    actual = calc.start_value
    expect(actual).to eq(1)
  end

end #end describe

#Include more calculation function before testing for result
describe "2. Create result & reset" do
  it 'should return the current result' do
    calc = Calculator.new(1)
    actual = calc.result
    expect(actual).to eq(1)
  end

  it "results should be readable only" do
      expect { calc.result += 1 }.to raise_error
  end

end #end describe

describe "3. my_calculator.add(x) should add 'x' to the internal result value:" do

  it "should record the input 'x'" do
    calc = Calculator.new(1)
    calc.input = 1
    actual = calc.input
    expect(actual).to eq(1)
  end

  it "Add method should add input to result" do
    calc = Calculator.new(1)
    calc.add(6)
    actual = calc.result
    expect(actual).to eq(7)
  end

end#end of describe

describe "4. Subtraction: my_calculator.subtract(x): " do
  it "should check if can subtract" do
      calc = Calculator.new(10)
      calc.subtract(3)
      actual = calc.result
      expect(actual).to eq(7)
  end

end#end describe

describe "5. Multiply: my_calculator.multiply(x)" do
  it "Instance should have an initial result value" do
    calc = Calculator.new(1)
    actual = calc.result
    expect(actual) .to eq(1)
  end

  it "should should collect user input" do
    calc = Calculator.new(1)
    calc.multiply(99)
    actual = calc.input
    expect(actual).to eq(99)
  end

  it "should multiply user input by internal result" do
    calc = Calculator.new(2)
    calc.multiply(90)
    actual = calc.result
    expect(actual).to eq(180)
  end

end #describe

describe "6. Chain: my_calculator.add(x).subtract(y)" do
  it "should add & subtract" do
    calc = Calculator.new(5)
    calc.add(9).subtract(10)
    actual = calc.result
    expect(actual).to eq(4)
  end
end #describe

describe "8. Operation: my_calculator.operation('add', x)" do

  it "should apply add-operation on value x if add is specified in param1" do
    calc = Calculator.new(1)
    calc.operation('add',2)
    calc.operation('add',2)
    calc.operation('add',2)
    calc.operation('add',2)
    actual = calc.result
    expect(actual).to eq(9)
  end

  it "should apply subtract-operation on value x if subtract is specified in param1" do
    calc = Calculator.new(40)
    10.times do
      calc.operation('subtract',2)
    end
    actual = calc.result
    expect(actual).to eq(20)
  end

end #describe

describe "9. Undo: my_calculator.undo" do
  it "should undo the previous operation, restoring the result value, if x can be a valid number" do
    calc = Calculator.new(30)
    calc.add(20)
    calc.add(20)
    calc.add(20)
    calc.subtract(20)
    calc.subtract(20)
    calc.undo
    actual = calc.result
    check = 30 + (20*3) - (20*2) + 20
    expect(actual).to eq(check)
  end
end

describe "10. Redo: my_calculator.redo" do

  it "should redo the previously undone operation, restoring the result value." do
    calc = Calculator.new(10)
    calc.subtract(1)
    calc.add(1)
    calc.undo
    calc.redo
    actual = calc.result
    expect(actual).to eq(10)
  end

  # it "should remove the ability to perform redos." do
  #
  # end

end #describe
