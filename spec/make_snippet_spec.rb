require "make_snippet"

RSpec.describe "make_snippet method" do
  it "Returns empty string if given empty string" do
    expect(make_snippet("")).to eq ""
  end
  it "Returns the string unchanged if less than five words" do
    expect(make_snippet("dear diary")).to eq "dear diary" 
  end
  it "Returns the string unchange if exactly five words (boundary)" do
    expect(make_snippet("one two three four five")).to eq "one two three four five"
  end
  it "Returns the first five words and ... if there are more" do
    expect(make_snippet("dear diary I feel pretty awesome today")).to eq "dear diary I feel pretty ..."
  end
  it "Fails if given nil" do
    expect { make_snippet(nil)}.to raise_error("Cannot process nil diary!")
  end
end
