require 'check_grammar'

RSpec.describe "check_grammar method" do
  it "returns false if given empty string" do
    expect(check_grammar?("")).to eq false
  end
  it "returns false if given non-capital single letter" do
    expect(check_grammar?("i")).to eq false
  end
  it "returns false if given Capital single letter" do
    expect(check_grammar?("I")).to eq false
  end
  it "returns false if given just valid end punctuation ." do
    expect(check_grammar?(".")).to eq false
  end
  it "returns false if given just valid end punctuation ?" do
    expect(check_grammar?("?")).to eq false
  end
  it "returns false if given just valid end punctuation !" do
    expect(check_grammar?("!")).to eq false
  end
  it "returns true if starts with capital letter and ends with ." do
    expect(check_grammar?("I.")).to eq true
  end
  it "returns true if starts with capital letter and ends with ?" do
    expect(check_grammar?("I.")).to eq true
  end
  it "returns true if starts with capital letter and ends with !" do
    expect(check_grammar?("I!")).to eq true
  end
  it "returns false if starts with capital letter and ends with ," do
    expect(check_grammar?("I,")).to eq false
  end
  it "returns false if doesn't start with capital letter but ends with ." do
    expect(check_grammar?("i.")).to eq false
  end
  it "returns false if doesn't start with capital letter but ends with ?" do
    expect(check_grammar?("i?")).to eq false
  end
  it "returns false if doesn't start with capital letter but ends with !" do
    expect(check_grammar?("i!")).to eq false
  end
  it "returns true if sentence starts with capital and ends with ." do
    expect(check_grammar?("I am a sentence.")).to eq true
  end
  it "returns true if sentence starts with capital and ends with ?" do
    expect(check_grammar?("Am I a sentence?")).to eq true
  end
  it "returns true if sentence starts with capital and ends with !" do
    expect(check_grammar?("I surely am a sentence!")).to eq true
  end
  it "returns false if string starts with capital and ends with ," do
    expect(check_grammar?("I wish I were a sentence,")).to eq false
  end
  it "returns false if string starts with capital and ends without punctuation" do
    expect(check_grammar?("So do I")).to eq false
  end
  it "returns false if string starts with lowercase and ends with ." do
    expect(check_grammar?("so do I.")).to eq false
  end
  it "throws an error if given nil instead of a string" do
    expect{ check_grammar?(nil) }.to raise_error("Cannot process nil")
  end
end