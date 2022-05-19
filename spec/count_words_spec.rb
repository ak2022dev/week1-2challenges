require "count_words"
RSpec.describe "count_words method" do
  it "returns zero for nil or empty string" do
    expect(count_words(nil)).to eq 0
    expect(count_words("")).to eq 0
  end
  it "returns count of words if input not nil or empty string" do
    expect(count_words("one")).to eq 1
    expect(count_words("one two")).to eq 2
  end
  it "strips leading and ending whitespace before counting" do
    expect(count_words(" one")).to eq 1
    expect(count_words("  one")).to eq 1
    expect(count_words("one  ")).to eq 1
    expect(count_words(" one ")).to eq 1
    expect(count_words(" one two ")).to eq 2
  end
end
