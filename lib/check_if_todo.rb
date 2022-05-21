def check_if_todo?(text)
  fail("Cannot process nil") if text.nil?
  return false if text == ""
  return text == "#TODO" || text[0..4] == "#TODO" || text[-5..-1] == "#TODO" || text.include?("#TODO")
end
