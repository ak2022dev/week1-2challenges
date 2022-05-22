class GrammarStats
  def initialize
    @count = 0
    @good_count = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with
    # a captital letter and ends with a sentence-ending punctuation mark
    @count += 1
    is_good = text[0] == text[0].upcase && [ ".", "?", "!" ].include?(text[-1])
    @good_count += 1 if is_good
    return is_good
  end

  def percentage_good
    @count == 0 ? 0 : ((( @good_count / @count.to_f )) * 100).to_i
  end
end
