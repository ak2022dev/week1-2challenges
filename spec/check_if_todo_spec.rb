require 'check_if_todo'

RSpec.describe "check_if_todo? method" do
  it "throws and error if given nil as input" do
    expect{check_if_todo?(nil)}.to raise_error("Cannot process nil")
  end
  it "returns false if given empty string as input" do
    expect(check_if_todo?("")).to eq false
  end
  it "returns true if given string '#TODO' as input" do
    expect(check_if_todo?("#TODO")).to eq true
  end
  it "returns true if given string '#TODO.' as input" do
    expect(check_if_todo?("#TODO.")).to eq true
  end
  it "returns true if given string '#TODO.....' as input" do
    expect(check_if_todo?("#TODO.....")).to eq true
  end
  it "returns true if given string '.#TODO' as input" do
    expect(check_if_todo?(".#TODO")).to eq true
  end
  it "returns true if given string '.....#TODO' as input" do
    expect(check_if_todo?(".....#TODO")).to eq true
  end
  it "returns true if given string '.#TODO.' as input" do
    expect(check_if_todo?(".#TODO.")).to eq true
  end
  it "returns true if given string '......#TODO....' as input" do
    expect(check_if_todo?("....#TODO....")).to eq true
  end
  it "returns false if given string 'some random string is not what we are looking for' as input" do
    expect(check_if_todo?("some random string is not what we are looking for")).to eq false
  end
end
