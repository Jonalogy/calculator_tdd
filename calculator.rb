class Calculator
  attr_accessor :input, :store_arr, :start_value
  attr_reader :result

  def initialize num
    @start_value = num
    @result = @start_value
    @store_arr = []
    @undo = false
  end

  def operation (xx, yy)
    if xx == 'add'
      add (yy)
    elsif xx == 'subtract'
      subtract (yy)
    end
    self
  end

  def add input
    @input = input
    @result += @input
    store('add',input)
    self
  end

  def subtract input
    @input = input
    @result = @result - @input
    store('subtract',input)
    self
  end

  def multiply input
    @input = input
    @result = @result * @input
  end

  def store (ops, val)
    if @undo == false
      @store_arr.push([ops,val])
    end
  end

  def undo
    @undo = true #so that store methods does not work

    @action = @store_arr.pop
    # puts "action = #{@action}"
    val = @action.pop
    ops = @action.pop
    # puts "val = #{val} and ops = #{ops}"
    if ops=="add"
      operation("subtract",val)
    elsif ops=="subtract"
      operation("add",val)
    end

    @undo = false #re-enables store method
  end #end undo

end #end Class

calc = Calculator.new(20)
puts "Starting value = #{calc.result}"

calc.add(1)
puts "Performed addition, checking result #{calc.result}"
puts "Checking store_arr #{calc.store_arr}"

calc.subtract(20)
puts "Performed subtraction checking result #{calc.result}"
puts "Checking store_arr #{calc.store_arr}"

calc.undo
puts "Perform undo"
puts "Checking result #{calc.result}"
puts "Checking store_arr #{calc.store_arr}"

calc.undo
puts "Perform undo"
puts "Checking result #{calc.result}"
puts "Checking store_arr #{calc.store_arr}"
