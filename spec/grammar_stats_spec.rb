require 'grammar_stats'

RSpec.describe GrammarStats do
  context "checks if text begins with capital letter and ends with valid punctuation" do
    it "returns false if neither starts with capital nor ends with punctuation" do
      gs = GrammarStats.new
      expect(gs.check"ab").to eq false
    end
    it "returns false if starts with capital but does not end with punctuation" do
      gs = GrammarStats.new
      expect(gs.check"Ab").to eq false
    end
    it "returns false if doesn't start with capital but ends with valid punctuation " do
      gs = GrammarStats.new
      expect(gs.check"a.").to eq false
    end
    it "returns true if starts with capital and ends with valid punctuation" do
      gs = GrammarStats.new
      expect(gs.check"I.").to eq true
    end
  end  
  context "reports percentage of texts so far that passed grammar check" do
    it "returns 0 % if no checks done yet" do
      gs = GrammarStats.new
      expect(gs.percentage_good).to eq 0
    end
    it "returns 0 % if one check done and it was not good" do
      gs = GrammarStats.new
      gs.check("ab")
      expect(gs.percentage_good).to eq 0
    end
    it "returns 100 % if one check done and it was good" do
      gs = GrammarStats.new
      gs.check("I!")
      expect(gs.percentage_good).to eq 100
    end
    it "returns 50 % if two checks done and one was good" do
      gs = GrammarStats.new
      gs.check("ab")
      gs.check("I!")
      expect(gs.percentage_good).to eq 50
    end
    it "returns 66 % if three checks done and two were good (integer round down)" do
      gs = GrammarStats.new
      gs.check("I?")
      gs.check("ba")
      gs.check("I!")
      expect(gs.percentage_good).to eq 66
    end
  end
end
