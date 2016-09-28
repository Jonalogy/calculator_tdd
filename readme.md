# TDD with RSpec: Let's Build a Calculator

## Introduction

> This will be a ping pong exercise, which means you'll be paired up with the person sitting next to you, and only _one_ of you can have your computer open at a time - it is probabaly easiest to just share the machine.

> For each task, one person (p1) will take 10 minutes to write somes tests before passing the laptop over to the other (p2) to write the code to pass the tests. After the tests have all been passed, the first person (p1) who will then write more tests. Repeat this process until the task is complete.

> When moving onto each new task, you should swap roles. So p1 does even numbered tasks and p2 does odd numbered tasks.

## Objective
You are required to build a Calculator class (calculator.rb) and a test suite for it (calculator_spec.rb).
Specifically, an instance of the Calculator class will store a single read_only instance variable that represents the result of any methods called on it.
Your tasks will be to add various mathematical functions to the class through a TDD process.
As the writer of tests your intention is to create tests that force a robust implementation.
As the writer of the code to pass the test, you want to implement the bare minimum to pass the test.

#### Tasks
0. **Initialize:* ```my_calculator = Calculator.new(1)``` would assign 1 to the be the starting result of the new my_calculator instance.
0. **Results:* ```my_calculator.result``` would return the curent result - tt should be readonly. ```my_calculator.reset(x)``` would reset the calculator to x.
0. **Addition:** ```my_calculator.add(x)``` would add x to the internal result value, if x can be a valid number
0. **Subtraction:** ```my_calculator.subtract(x)``` would subtract x from the internal result value, if x can be a valid number
0. **Multiply:** ```my_calculator.multiply(x)``` would multiply x by the internal result value and save the new value, if x can be a valid number
0. **Divide:** ```my_calculator.divide(x)``` would divide the internal result value by x and save the new value, if x can be a valid number
0. **Chain:** ```my_calculator.add(x).subtract(y)``` all methods should be chainable in any order
0. **Operation:** ```my_calculator.operation('add', x)``` would apply the addition operation with the value of x. It should support all operations
0. **Undo:** ```my_calculator.undo(x)``` should undo the previous operation, restoring the result value, if x can be a valid number
0. **Redo:** ```my_calculator.redo(x)``` should redo the previously undone operation, restoring the result value. A new action should remove the ability to perform redos.

## Additional Resources

- [Rspec](http://rspec.info)
- [Ruby Styleguide](https://github.com/bbatsov/ruby-style-guide)
- [Programming Ruby - The Pragmatic Programmer's Guide](http://phrogz.net/programmingruby/tut_classes.html)
