require 'estimate_reading_time'

RSpec.describe "estimate_reading_time method" do
  it "returns 0 minutes if given an empty string" do
    expect(estimate_reading_time("")).to eq 0
  end

  it "returns 1 minute if given a string with 200 words" do 
    result = estimate_reading_time("word " * 200) 
    expect(result).to eq 1
  end

  it "returns 2 minutes if given a string with 400 words" do
    result = estimate_reading_time("word " * 400) 
    expect(result).to eq 2
  end 

  it "returns 20 minutes if given a string with 4000 words" do
    result = estimate_reading_time("word " * 4000) 
    expect(result).to eq 20
  end

  it "returns 1 minute if word count is > 0 but < 200" do
    result = estimate_reading_time("word " * 50) 
    expect(result).to eq 1 
  end

  it "returns 2 minutes if word count should round up to 2 mins" do
    result = estimate_reading_time("word " * 399)
    expect(result).to eq 2
  end
end
