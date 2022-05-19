{{PROBLEM}} Method Design Recipe
1. Estimate Reading Time
As a user
So that I can manage my time
I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

I am assuming given the text we count the words then divide by 200 to estimate the number of minutes to read it.

2. Design the Method Signature

# `estimate_reading_time` returns estimate in minutes of time to read given text
mins_to_read = estimate_reading_time(text)

text: a string, quite a long one, maybe several hundred words long
mins_to_read: an integer estimating number of minutes to read the text
# The method doesn't print anything or have any other side-effects

3. Create Examples as Tests

Make a list of examples of what the method will take and return.

# EXAMPLE

estimate_reading_time("") => 0 minutes
estimate_reading_time(TWO_HUNDRED_WORDS) => 1 minutes
estimate_reading_time(FOUR_HUNDRED_WORDS) => 2 minutes
estimate_reading_time(FOUR_THOUSAND_WORDS) => 20 minutes
estimate_reading_time(FIFTY) => 1 minute
estimate_reading_time(THREE_HUNDRED_AND_NINETY_NINE) => 2 minutes 
estimate_reading_time(nil) throws an error

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.