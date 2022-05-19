{{PROBLEM}} Method Design Recipe

1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature

Include the name of the method, its parameters, return value, and side effects.

is_sentence = check_grammar?(sentence)

check_grammar? : method
sentence : string
is_sentence: boolean 

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

check_grammar("I am a sentence.") => true
check_grammar("i am a sentence.") => false
check_grammar("Am I a sentence?") => true
check_grammar("am I a sentence?") => false
check_grammar("I am a sentence!") => true
check_grammar("i am a sentence!") => false
check_grammar("Yes, I am a sentence,") => false
check_grammar("I am not a sentence") => false
check_grammar("i want to be a sentence") => false
check_grammar(78) throws error
check_grammar(nil) throws error
# EXAMPLE

extract_uppercase("hello WORLD") => ["WORLD"]
extract_uppercase("HELLO WORLD") => ["HELLO", "WORLD"]
extract_uppercase("hello world") => []
extract_uppercase("hello WoRLD") => []
extract_uppercase("hello WORLD!") => ["WORLD"]
extract_uppercase("") => []
extract_uppercase(nil) throws an error
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.