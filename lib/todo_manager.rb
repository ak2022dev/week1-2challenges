class TodoManager
  def initialize
    @todos = []
  end

  def list
    @todos
  end

  def add(todo)
    @todos << todo unless @todos.include?(todo)
  end

  def remove(todo)
    fail("Can't remove anything from empty list!") if @todos == []
    fail("Can't remove something if it's not in list!") unless @todos.include?(todo)
    @todos.delete(todo)
  end
end