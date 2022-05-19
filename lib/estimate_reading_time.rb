def estimate_reading_time(text)
  (text.split(" ").length.to_f / 200.0).ceil
end


