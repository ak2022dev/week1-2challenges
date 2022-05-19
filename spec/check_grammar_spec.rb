require 'check_grammar'

RSpec.describe "check_grammar method" do

  it "returns true for a sentence with a capital letter and full stop" do
    expect(check_grammar("I am a sentence.")).to eq true
  end

  it "returns true for a sentence that doesn't start with a capital letter" do
    expect(check_grammar("i am a sentence.")).to eq false
  end
end