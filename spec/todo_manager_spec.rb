require 'todo_manager'

RSpec.describe TodoManager do
  context "Initialize" do
    it "starts with an empty list" do
      todos = TodoManager.new
      expect(todos.list).to eq []
    end
  end
  context "Adding todos" do
    it "adds a todo to an empty list" do
      todos = TodoManager.new
      todos.add("First task")
      expect(todos.list).to eq ["First task"]
    end
    it "adds a todo to end of non-empty list" do
      todos = TodoManager.new
      todos.add("First task")
      todos.add("Second task")
      expect(todos.list).to eq ["First task", "Second task"]
    end
    it "adds doesn't re-add a duplicate" do
      todos = TodoManager.new
      todos.add("First task")
      todos.add("First task")
      expect(todos.list).to eq ["First task"]
    end
  end
  context "Removing todos" do
    it "fails if asked to remove anything from an empty list" do
      todos = TodoManager.new
      expect{todos.remove("First task")}.to raise_error("Can't remove anything from empty list!")
    end
    it "fails if asked to remove a todo that's not in the list" do
      todos = TodoManager.new
      todos.add("First task")
      expect{todos.remove("Second task")}.to raise_error("Can't remove something if it's not in list!") 
    end
    it "removes a single todo that was the only todo in the list" do
      todos = TodoManager.new
      todos.add("First task")
      todos.remove("First task")
      expect(todos.list).to eq [] 
    end
    it "removes first todo that was in the list" do
      todos = TodoManager.new
      todos.add("First task")
      todos.add("Second task")
      todos.remove("First task")
      expect(todos.list).to eq ["Second task"] 
    end
    it "removes last todo that was in the list" do
      todos = TodoManager.new
      todos.add("First task")
      todos.add("Second task")
      todos.remove("Second task")
      expect(todos.list).to eq ["First task"] 
    end
    it "removes todo that was in the list neither at start nor at end" do
      todos = TodoManager.new
      todos.add("First task")
      todos.add("Second task")
      todos.add("Third task")
      todos.remove("Second task")
      expect(todos.list).to eq ["First task", "Third task"] 
    end
  end
end
