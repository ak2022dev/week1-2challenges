{{PROBLEM}} Class Design Recipe
1. Class to manage todos - including marking to make them disappear from list

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

2. Design the Class Interface


class TodoManager
  def initialize
    @todos = []
  end

  def add(todo)
    # Adds todo to todos
    # Doesn't add duplicates
  end

  def remove(todo)
    # Removes todo from todos
    # Fails if trying to remove from empty list or trying to remove something not already in list
  end

  def list
    # Lists todos
  end
end

3. Create Examples as Tests

Make a list of examples of how the class will behave in different situations.

# EXAMPLE

# 1
todos = TodoManager.new
todos.list => []

# 2
todos = TodoManager.new
todos.add("First task")
todos.list => ["First task"]

# 2a
todos = TodoManager.new
todos.add("First task")
todos.add("Second task")
todos.list => ["First task", "Second task"]

# 2a
# Don't add a duplicate
todos = TodoManager.new
todos.add("First task")
todos.add("First task")
todos.list => ["First task"]

# 3
todos = TodoManager.new
todos.remove("First task") => fail "Can't remove anything from empty todo list"

# 3
todos = TodoManager.new
todos.add("First task")
todos.remove("Second task") => fail "Can't remove something if it's not in list"

# 4
todos = TodoManager.new
todos.add("First task")
todos.remove("First task")
todos.list => []

# 4a
todos = TodoManager.new
todos.add("First task")
todos.add("Second task")
todos.remove("First task")
todos.list => ["Second task"]

# 4b
todos = TodoManager.new
todos.add("First task")
todos.add("Second task")
todos.remove("Second task")
todos.list => ["First task"]

# 4c
todos = TodoManager.new
todos.add("First task")
todos.add("Second task")
todos.add("Third task")
todos.remove("Second task")
todos.list => ["First task", "Third task"]

Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.