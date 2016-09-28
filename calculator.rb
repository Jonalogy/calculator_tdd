class Calculator
  attr_accessor :input, :history, :start_value, :undone
  attr_reader :result

  def initialize num
    @start_value = num
    @result = @start_value
    @history = [] #Stores past operations in the form of 2-dim array
    @undone = [] #Stores user's undo history
    @undo_switch = false
  end

  def add input
    @input = input
    @result += @input
    store('add',input) #Stores action into array @history
    self
  end

  def subtract input
    @input = input
    @result = @result - @input
    store('subtract',input) #Stores action into array @history
    self
  end

  # multiply method is incomplete
  def multiply input
    @input = input
    @result = @result * @input
  end

  # complete multiply and divide methods and update operation method
  def operation (ops, val)
    if ops == 'add'
      add (val)
    elsif ops == 'subtract'
      subtract (val)
    end
    self
  end

  def store (ops, val)
      # the store method tracks the previous operations made by the user in an array @history. A conditional variable @undo_switch is included to prevent an undo action to store its own operation. In that case, multiple undos will only be cycling through the latest user action and undo action.

    if @undo_switch == false
      @history.push([ops,val])
    end
  end

  def undo
    @undo_switch = true #so that store methods does not work

    action = @history.pop; puts ">>Undoing= #{action}"
    @undone.push(action.clone); #puts ">>undone = #{@undone}"

    val = action.pop
    ops = action.pop
    if ops=="add"
      operation("subtract",val)
    elsif ops=="subtract"
      operation("add",val)
    end
    @undo_switch = false #re-enables store method
  end #end undo

  def redo
    if @undone.length != 0
        to_redo = @undone.pop; puts ">>Redoing: #{to_redo}"

        val = to_redo.pop
        ops = to_redo.pop

        if ops=="subtract"
          operation("subtract",val)
        elsif ops=="add"
          operation("add",val)
        end
    else
        puts "Nothing to redo..."
    end
  end#redo

end #end Class

calc = Calculator.new(20)
puts "Starting value = #{calc.result}"

calc.add(1)
puts "Performed addition of 1, checking result #{calc.result}"
puts "Checking history #{calc.history}"

calc.subtract(20)
puts "Performed subtraction of 20 checking result #{calc.result}"
puts "Checking history #{calc.history}"

calc.add(5)
puts "Performed addition of 5 checking result #{calc.result}"
puts "Checking history #{calc.history}"

calc.undo
puts "Checking result #{calc.result}"
puts "Checking history #{calc.history}"
puts "Checking undone #{calc.undone}"

calc.undo
puts "Checking result #{calc.result}"
puts "Checking history #{calc.history}"
puts "Checking undone #{calc.undone}"

calc.redo
puts "Checking result #{calc.result}"
calc.redo
puts "Checking result #{calc.result}"
calc.redo
puts "Checking result #{calc.result}"
