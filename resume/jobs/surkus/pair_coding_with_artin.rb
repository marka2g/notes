# Write a function that takes a string as an argument and reverses that string # in-place (e.g. does not create a new string but modifies the string that was # passed into the method). You may not use Ruby's built in #reverse! method but # must write your own implementation.

def reverse_string(s)
  chars_array = s.chars

  (0..chars_array.length-1).inject("") do |memo, index|
    memo += chars_array.pop
    memo
  end
end

# Test
# puts reverse_string('blah')
reverse_string('blah')

# # Artin's notes
# # s = 'hi'
# # reverse_string(s)
# # s == 'ih'
#
# def reverse_string(s)
#   # write your code here
#
#   # count = 0
#   # size = s.length
#
#   # start at end of chars_array and loop through exactly the length ->
#
#   #
#   # (0..chars_array.size-1)
#
#   # each_with_index(chars_array) |char, index| do
#   #   puts "char: #{char} index: #{index}"
#   # end
#
#   # puts "char: #{char} index: #{index}"
#
#   chars_array = s.chars
#   new_array = []
#   chars_array.each do |char|
#     new_array.unshift(char)
#   end
#   new_array.join('')
# end
#
# #each_with_object({}) do |value, memo|
#
# puts reverse_string('blah')
#
