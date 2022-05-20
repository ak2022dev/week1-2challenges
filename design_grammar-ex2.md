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

check_grammar("") => false
check_grammar("i") => false
check_grammar("I") => false
check_grammar(".") => false
check_grammar("?") => false
check_grammar("!") => false
check_grammar("I.") => true
check_grammar("I?") => true
check_grammar("I!") => true
check_grammar("I,") => false
check_grammar("i.") => false
check_grammar("i?") => false
check_grammer("i!") => false
check_grammar("I am a sentence.") => true
check_grammar("Am I a sentence?") => true
check_grammar("I surely am a sentence!") => true
check_grammar("I wish I were a sentence,") => false
check_grammar("So do I") => false
check_grammar("so do I.") => false
check_grammar(nil) throws error


4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.