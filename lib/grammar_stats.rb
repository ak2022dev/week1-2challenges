class GrammarStats
  def initialize
    @count = 0
    @good_count = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with
    # a captital letter and ends with a sentence-ending punctuation mark
    text[0] == text[0].upcase && [ ".", "?", "!" ].include?(text[-1])
  end
end
