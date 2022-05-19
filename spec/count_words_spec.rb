require "count_words"

RSpec.describe "count_words method" do
  it "returns zero when given empty string" do
    expect(count_words("")).to eq 0
  end
  it "returns count of one for one word" do
    expect(count_words("one")).to eq 1
  end
  it "returns count of two for two words separated by a space" do
    expect(count_words("one two")).to eq 2
  end
  it "strips a single leading space before counting a single word" do
    expect(count_words(" one")).to eq 1
  end
  it "strips a concluding space before counting a single word" do
    expect(count_words("one ")).to eq 1
  end
  it "strips multiple initial spaces before counting a single word" do
    expect(count_words("  one")).to eq 1
  end
  it "strips multiple concluding spaces before counting a single word" do
    expect(count_words("one  ")).to eq 1
  end
  it "strips both an initial and final space before counting a single word" do
    expect(count_words(" one ")).to eq 1
  end
  it "strips both initial and final space before counting multiple words" do
    expect(count_words(" one two ")).to eq 2
  end
  it "fails if given nil as input" do
    expect{count_words(nil)}.to raise_error("Can't count words given nil input!")
  end
end
