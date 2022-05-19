require "make_snippet"

RSpec.describe "make_snippet method" do
  it "Returns all the words if there are less than 5" do
    expect(make_snippet("")).to eq ""
    expect(make_snippet("dear diary")).to eq "dear diary" 
    expect(make_snippet("one two three four five")).to eq "one two three four five"
  end
  it "Returns the first five words and ... if there are more" do
    expect(make_snippet("dear diary I feel pretty awesome today")).to eq "dear diary I feel pretty ..."
  end
  it "Fails if given nil" do
    expect { make_snippet(nil)}.to raise_error("Cannot process nil diary!")
  end
end
