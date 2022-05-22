require 'diary_entry'

RSpec.describe DiaryEntry do
  it "can tell you the title of its entry" do
    entry = DiaryEntry.new("title", "contents")
    expect(entry.title).to eq "title"
  end
  it "can tell you the contents of its entry" do
    entry = DiaryEntry.new("title", "contents")
    expect(entry.contents).to eq "contents"
  end
  it "can tell you the number of words in its entry" do
    entry = DiaryEntry.new("title", "word " * 50)
    expect(entry.count_words).to eq 50
  end
  it "estimates one minute as minimum time" do
    entry = DiaryEntry.new("title", "word " * 150)
    expect(entry.reading_time(200)).to eq 1
  end
  it "estimates one minute reading time of 150 words at 150 wpm" do
    entry = DiaryEntry.new("title", "word " * 150)
    expect(entry.reading_time(150)).to eq 1
  end
  it "estimates two minute reading time of 151 words at 150 wpm" do
    entry = DiaryEntry.new("title", "word " * 151)
    expect(entry.reading_time(150)).to eq 2
  end
  it "estimates three minute reading time of 350 words at 150 wpm" do
    entry = DiaryEntry.new("title", "word " * 350)
    expect(entry.reading_time(150)).to eq 3
  end
  it "gives a single chunk of reading for text length 50 words, wpm 150 wpm, limit one minute" do
    entry = DiaryEntry.new("title", "word " * 50)
    expect(entry.reading_chunk(150, 1)).to eq (entry.contents).strip
  end
  it "gives a single chunk of reading for text length 50 words, wpm 150 wpm, limit one minute repeatedly on re-calling" do
    entry = DiaryEntry.new("title", "word " * 50)
    expect(entry.reading_chunk(150, 1)).to eq (entry.contents).strip
    expect(entry.reading_chunk(150, 1)).to eq (entry.contents).strip
    expect(entry.reading_chunk(150, 1)).to eq (entry.contents).strip
  end
  it "for text length 250 words, wpm 150 wpm, limit one minute gives first 150 words on first call" do
    entry = DiaryEntry.new("title", "first " * 149 + "second " * 101)
    expect(entry.reading_chunk(150, 1)).to eq (("first " * 149) + "second").strip
  end
  it "for text length 250 words, wpm 150 wpm, limit one minute gives first 150 words on first call and remaining 100 on second call" do
    test_string = (1..250).to_a.to_s
    test_string = test_string.delete "["
    test_string = test_string.delete "]"
    test_string = test_string.delete ","
    entry = DiaryEntry.new("title", test_string)
    result = entry.reading_chunk(150,1).split(" ")
    expect(result[0].strip).to eq "1"
    expect(result[149].strip).to eq "150"
    result = entry.reading_chunk(150,1).split(" ")
    expect(result.length).to eq 100
    expect(result[0].strip).to eq "151"
    expect(result[99].strip).to eq "250"
  end
  it "for text length 250 words, wpm 150 wpm, limit one minute gives first 150 words on first call and remaining 100 on second call, then first 150 again on first call" do
    test_string = (1..250).to_a.to_s
    test_string = test_string.delete "["
    test_string = test_string.delete "]"
    test_string = test_string.delete ","
    entry = DiaryEntry.new("title", test_string)
    result = entry.reading_chunk(150,1).split(" ")
    expect(result[0].strip).to eq "1"
    expect(result[149].strip).to eq "150"
    result = entry.reading_chunk(150,1).split(" ")
    expect(result.length).to eq 100
    expect(result[0].strip).to eq "151"
    expect(result[99].strip).to eq "250"
    result = entry.reading_chunk(150,1).split(" ")
    expect(result[0].strip).to eq "1"
    expect(result[149].strip).to eq "150"
  end
  it "for text length 1000 words, wpm 150 wpm, limit one minute gives first 150 words on first call, then second call 150 wpm 2 mins gives next 300 words then third call 200 wpm 5 mins gives all remaining words " do
    test_string = (1..1000).to_a.to_s
    test_string = test_string.delete "["
    test_string = test_string.delete "]"
    test_string = test_string.delete ","
    entry = DiaryEntry.new("title", test_string)
    result = entry.reading_chunk(150,1).split(" ")
    expect(result[0].strip).to eq "1"
    expect(result[149].strip).to eq "150"
    result = entry.reading_chunk(150,2).split(" ")
    expect(result.length).to eq 300
    expect(result[0].strip).to eq "151"
    expect(result[299].strip).to eq "450"
    result = entry.reading_chunk(200,5).split(" ")
    expect(result[0].strip).to eq "451"
    expect(result[-1].strip).to eq "1000"
  end
  it "for text length 1000 words, wpm 150 wpm, limit one minute gives first 150 words on first call, then second call 150 wpm 2 mins gives next 300 words then third call 200 wpm 5 mins gives all remaining words, then fourth call 150wpm 3 mins gives first 450 words again " do
    test_string = (1..1000).to_a.to_s
    test_string = test_string.delete "["
    test_string = test_string.delete "]"
    test_string = test_string.delete ","
    entry = DiaryEntry.new("title", test_string)
    # First call
    result = entry.reading_chunk(150,1).split(" ")
    expect(result[0].strip).to eq "1"
    expect(result[149].strip).to eq "150"
    # Second call
    result = entry.reading_chunk(150,2).split(" ")
    expect(result.length).to eq 300
    expect(result[0].strip).to eq "151"
    expect(result[299].strip).to eq "450"
    # Third call
    result = entry.reading_chunk(200,5).split(" ")
    expect(result[0].strip).to eq "451"
    expect(result[-1].strip).to eq "1000"
    # Fourth call
    result = entry.reading_chunk(150,3).split(" ")
    expect(result[0].strip).to eq "1"
    expect(result[-1].strip).to eq "450"
  end
end
