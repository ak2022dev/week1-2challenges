def check_grammar?(sentence)
  fail ("Cannot process nil") if sentence.nil?
  if sentence == "" || sentence.length == 1
    return false
  else
    return ('A'..'Z').include?(sentence[0]) && ['.','?','!'].include?(sentence[-1])
  end
end
