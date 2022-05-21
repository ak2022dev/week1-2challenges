=begin
def encode(plaintext, key)
  puts "Inside encode method"
  puts "plaintext is #{plaintext}"
  puts "key is #{key}"
  puts "key.chars.uniq is #{key.chars.uniq}"
  puts "('a'..'z').to_a - key.chars is #{('a'..'z').to_a - key.chars}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  puts "cipher is #{key.chars.uniq + (('a'..'z').to_a - key.chars)}"
  puts "plaintext.chars is #{plaintext.chars}"
  ciphertext_chars = plaintext.chars.map do |char|
    puts "Inside map block"
    puts "char is #{char}"
    puts "cipher.find_index is: #{cipher.find_index}"
    puts "cipher.find_index(char) is: #{cipher.find_index(char)}"
    puts "65 + cipher.find_index(char)).chr is #{(65 + cipher.find_index(char)).chr}"
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end

def decode(ciphertext, key)
  puts "Inside Decode Method."
  puts "Cipher Text is: #{ciphertext}"
  puts "Key is: #{key}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  puts "keys.chars #{key.chars}"
  puts "keys.chars.uniq #{key.chars.uniq}"
  puts "(('a'..'z').to_a - key.chars) - #{(('a'..'z').to_a - key.chars)}"
  puts "cipher: #{cipher}"
  puts "ciphertext.chars is: #{ciphertext.chars}"
  plaintext_chars = ciphertext.chars.map do |char|
    puts "In map block"
    puts "char is #{char}"
    puts "char.ord is #{char.ord}"
    cipher[65 - char.ord]
    puts "cipher[65 - char.ord] is #{cipher[65 - char.ord]}"
  end
  return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
=end
def encode(plaintext, key)
  # puts "Inside encode method"
  # puts "plaintext is #{plaintext}"
  # puts "key is #{key}"
  # puts "key.chars.uniq is #{key.chars.uniq}"
  # puts "('a'..'z').to_a - key.chars is #{('a'..'z').to_a - key.chars}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # puts "cipher is #{key.chars.uniq + (('a'..'z').to_a - key.chars)}"
  # puts "plaintext.chars is #{plaintext.chars}"
  ciphertext_chars = plaintext.chars.map do |char|
    # puts "Inside map block"
    # puts "char is #{char}"
    # puts "cipher.find_index is: #{cipher.find_index}"
    # puts "cipher.find_index(char) is: #{cipher.find_index(char)}"
    # puts "65 + cipher.find_index(char)).chr is #{(65 + cipher.find_index(char)).chr}"
    (65 + cipher.find_index(char)).chr
  end
  return ciphertext_chars.join
end
def decode(ciphertext, key)
  # puts "Inside Decode Method."
  # puts "Cipher Text is: #{ciphertext}"
  # puts "Key is: #{key}"
  cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
  # puts "keys.chars #{key.chars}"
  # puts "keys.chars.uniq #{key.chars.uniq}"
  # puts "(('a'..'z').to_a - key.chars) - #{(('a'..'z').to_a - key.chars)}"
  # puts "cipher: #{cipher}"
  # puts "ciphertext.chars is: #{ciphertext.chars}"
  plaintext_chars = ciphertext.chars.map do |char|
    # puts "In map block"
    # puts "char is #{char}"
    # puts "char.ord is #{char.ord}"
    cipher[char.ord - 65]
    # puts "cipher[65 - char.ord] is #{cipher[char.ord - 65]}"
  end
  return plaintext_chars.join
end
puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"