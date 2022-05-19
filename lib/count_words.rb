def count_words(words)
  if words.nil?
    fail("Can't count words given nil input!")
  end
  if words == ""
    return 0
  else
    return words.strip.split(" ").length
  end
end
