def get_most_common_letter(text)
  # puts "Inside get_most_common_letter"
  # puts "text is #{text}"
  counter = Hash.new(0)
  text.chars.each do |char|
    # This was previously counting non-letter chars
    # Added if to only count letters of alphabet, non-case-sensitive
    if "abcdefghijklmnopqrstuvwxyz".include?(char.downcase)
      counter[char.downcase] += 1
    end
    # puts "counter[#{char}] is #{counter[char]}"
  end
  # Above change in if seems to have fixed the count
  # puts "Puts outside each block"
  # puts "counter is #{counter}"
  # puts "counter.to_a is #{counter.to_a}"
  # puts "About to sort"
  counter.to_a.sort_by { |k, v| v }[-1][0]
  # puts "sort completed"
  # puts "counter.to_a.sort_by { |k, v| v } is #{counter.to_a.sort_by { |k, v| v }} "
  # puts "counter.to_a.sort_by { |k, v| v }[-1][0] is #{counter.to_a.sort_by { |k, v| v }[-1][0]}"
  # Seems we need the last element, not the first
  # Will change above index from [0][0] to [-1][0]
end

puts get_most_common_letter("the roof, the roof, the roof is on fire!")
# Further simple test intended output
# >get_most_common_letter("aaabbbbcccccddddeee")
# => "c"
# puts get_most_common_letter("aaabbbbcccccddddeee")
# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"