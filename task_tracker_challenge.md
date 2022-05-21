{{PROBLEM}} Method Design Recipe
1. Check if todo... 

As a user
So that I can keep track of my tasks
I want to check if a text includes the string #TODO

2. Design the Method Signature

Method name: check_if_todo?(text)
Parameter: text is a string
Return value: boolean
Side effects: none

Throws error if given nil as input


3. Create Examples as Tests

check_if_todo?(nil) => error message "Can't process nil"
check_if_todo?("") => false
check_if_todo?("#TODO") => true
check_if_todo?("#TODO.") => true
check_if_todo?("#TODO.....") => true
check_if_todo?(".#TODO") => true
check_if_todo?(".....#TODO") => true
check_if_todo?(".#TODO.") => true
check_if_todo?(".....#TODO.....") => true
check_if_todo?("some random string is not what we are looking for") => false

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
