def count_words(words)
  if words.nil? || words == ""
    return 0
  else
    return words.strip.split(" ").length
  end
end