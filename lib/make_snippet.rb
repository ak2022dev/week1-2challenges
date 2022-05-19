# Make a snippet of diary

def make_snippet(diary)
  if diary.nil?
    fail "Cannot process nil diary!"
  end
  array = diary.split(" ")
  if array.length > 5
    return array.take(5).push("...").join(" ")
  else
    return diary
  end
end
