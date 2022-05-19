require 'estimate_reading_time'

RSpec.describe "estimate_reading_time method" do
  it "returns 0 minutes if given an empty string" do
    expect(estimate_reading_time("")).to eq 0
  end
end
