# a = [3, 1, 2, 4, 3]
# 1st -> [3] - [1, 2, 4, 3] -> (3 - 10).abs -> 7
# 2nd -> [3 + 1] - [2, 4, 3] -> (4 - 9).abs -> 5
# 3rd -> [3 + 1 + 2] - [4, 3] -> (6 - 7).abs -> 1
# 4th -> [3 + 1 + 2 + 4] - [3] -> (10 - 3).abs -> 7

# binding.pry
# 7th attempt

def solution(a)
  left_side = a[0]
  right_side = a[1..-1].reduce(:+)
  difference_between_the_two = find_diff(a[0], a[1..-1].reduce(:+))
  (2..a.length-1).each do |index|
# binding.pry
    left_side  += a[index-1]
    right_side -= a[index-1]
    updated_difference = find_diff(left_side, right_side)
    if updated_difference < difference_between_the_two
      difference_between_the_two = updated_difference
    end
  end
  difference_between_the_two
end

def find_diff(left, right)
  (left - right).abs
end
a = [3, 1, 2, 4, 3]
solution(a)


# map = {}
# (0..a.length-1).each do |index|
#   map
# end

# binding.pry
# 7th attempt

def solution(a)
  dict, result = {first: [[a[0]].inject(:+), a[1..-1].inject(:+)], second: [a[0..1].inject(:+), a[2..-1].inject(:+)], third: [a[0..2].inject(:+), a[3..-1].inject(:+)], forth: [a[0..3].inject(:+), a[4..-1].inject(:+)]}, []

  dict.each do |key, values|
    result << (values[0] - values[1]).abs
    return result.min if result.length == a.length-1
  end
end

a = [3, 1, 2, 4, 3]
solution(a)


# 6th attempt - 25%
def solution(a)
  dict, result = {first: [[a[0]].inject(:+), a[1..-1].inject(:+)], second: [a[0..1].inject(:+), a[2..-1].inject(:+)], third: [a[0..2].inject(:+), a[3..-1].inject(:+)], forth: [a[0..3].inject(:+), a[4..-1].inject(:+)]}, []

  dict.each do |key, values|
    result << (values[0] - values[1]).abs
    return result.min if result.length == a.length-1
  end
end


a = [3, 1, 2, 4, 3]
solution(a)


# 5th attempt - 25%
def solution(a)
  dict, result = {first: [[a[0]].reduce(:+), a[1..-1].reduce(:+)], second: [a[0..1].reduce(:+), a[2..-1].reduce(:+)], third: [a[0..2].reduce(:+), a[3..-1].reduce(:+)], forth: [a[0..3].reduce(:+), a[4..-1].reduce(:+)]}, []

  dict.each do |key, values|
    result << find_diff(values[0], values[1])
    return result.min if result.length == a.length-1
  end
end

def find_diff(left, right)
  (left - right).abs
end
a = [3, 1, 2, 4, 3]
solution(a)

# 4th attempt - 33%
def solution(a)
  dict, result = {first: [[a[0]], a[1..-1]], second: [a[0..1], a[2..-1]], third: [a[0..2], a[3..-1]], forth: [a[0..3], a[4..-1]]}, []

  dict.each do |key, values|
    result << find_diff(values[0].reduce(:+), values[1].reduce(:+))
    return result.min if result.length == a.length-1
  end
end

def find_diff(left, right)
  (left - right).abs
end
a = [3, 1, 2, 4, 3]
solution(a)

# def solution(a)
#   dict, result = {first: [[a[0]], a[1..-1]], second: [a[0..1], a[2..-1]], third: [a[0..2], a[3..-1]], forth: [a[0..3], a[4..-1]]}, []
#
#   dict.each do |key, values|
# binding.pry if result.length == 3
#     result << find_diff(values[0].reduce(:+), values[1].reduce(:+))
#     return result.min if result.length == a.length-1
#   end
# end

# binding.pry
# 2nd attempt - 50% Detected time complexity: O(N * N) - inject, reduce, reduce
def solution(a)
  first_pass = find_diff([a[0]], a[1..-1])
  (1..a.length-1).inject([first_pass]) do |memo, idx|
    return memo.min if memo.length == (a.length-1)
    memo << find_diff(a[0..idx], a[idx+1..-1])
  end
end

# binding.pry
def find_diff(left, right)
  (left.reduce(:+) - right.reduce(:+)).abs
end
# test
a = [3, 1, 2, 4, 3]
solution(a)

watch idx
watch memo
watch left_sum
watch right_sum

# {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}

# 1st submisson - 50% Detected time complexity: O(N * N)

def solution(a)
  first_pass = find_diff(a[0], a[1..-1].reduce(:+))
  (1..a.length-1).inject([first_pass]) do |memo, idx|
    return memo.min if memo.length == (a.length-1)
    left_sum = a[0..idx].reduce(:+)
    right_sum = a[idx+1..-1].reduce(:+)
    memo << find_diff(left_sum, right_sum)
  end
end

def find_diff(left_sum, right_sum)
  (left_sum - right_sum).abs
end

# {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}

# array.slice(0).sum + a.slice(1..-1).sum
  # fails because array.slice(0) -> 3 can't be summed -> not an array
def solution(a)
  (0..a.length-1).inject(Array.new) do |memo, index|
binding.pry
    left_sum = index == 0 ? a[index] : a[0..index].reduce(:+)
    right_sum = a[(index + 1)..-1].reduce(:+)
    memo << find_diff(left_sum, right_sum)
    memo
  end.min
end

def find_diff(left_sum, right_sum)
binding.pry
  unless left_sum.nil? && right_sum.nil?
    (left_sum - right_sum).abs
  end
end
# a = [3, 1, 2, 4, 3]
# solution(a)
# array = [3, 1, 2, 4, 3]
# solution(array)


def solution(a)
  (0..a.length-1).inject([]) do |memo, index|
    left_arr, right_arr = a[0..index], a[(index + 1)..-1]
    left_sum = index == 0 ? a[index] : left_arr.sum
    right_sum = right_arr.sum
    memo << find_diff(left_sum, right_sum)
    memo
  end.min
end

def find_diff(left_sum, right_sum)
  (left_sum - right_sum).abs
end

left_sum = index == 0 ? a[index] : (a[0..index]).sum

# slice - nope
def solution(a)
  (0...a.length).inject([]) do |memo, index|
    left_side = index == 0 ? a.pop : a.slice(0..index).sum
    right_side = a.slice((index + 1)..-1).sum
    memo << (left_side - right_side).abs
    memo
  end.min
end
# a = [3, 1, 2, 4, 3]
# solution(a)


def solution(a)
  (0..a.length-1).inject([]) do |memo, index|
    left_side = index == 0 ? a.pop : a.slice(0..index).sum
    right_side = a.slice(index + 1..-1).sum
    memo << (left_side - right_side).abs
    memo
  end.min
end
# a = [3, 1, 2, 4, 3]
# solution(a)

def solution(a)
  (1..a.length-1).inject([a[0]]) do |memo, idx|
    left_side, right_side = a[0..idx], a[idx+1..-1]
    puts "memo: #{memo} left sum #{left_side.sum} right sum #{right_side.sum} - "
    memo << (left_side.sum - right_side.sum).abs
    memo
  end.min
end
# solution(a)

def solution(a)
  (1..a.length-1).inject([a[0]]) do |memo, idx|
    memo << (a[0..idx].sum - a[idx+1..-1].sum).abs
    memo
  end.min
end
# solution(a)

def solution(a)
  range = 0..a.length-1
  (range).inject([]) do |memo, idx|
    left_side = idx == 0 ? a[idx] : a[0..idx].sum
    right_side = a[idx+1..-1].sum
    memo << (left_side - right_side).abs
    memo
  end.min
end
# a = [3, 1, 2, 4, 3]
# solution(array)
# solution(a)

def solution(array)
  (0..array.length-1).inject([]) do |memo, index|
    left_side = index == 0 ? array[index] : array[0..index].sum
binding.pry
    memo << (left_side - array[index+1..-1].sum).abs
    memo
  end.min
end
# test
# array = [3, 1, 2, 4, 3]
# solution(array)

# array = [3, 1, 2, 4, 3]
# # p_count = 0
# (0..array.length).inject([]) do |memo, index|
# binding.pry
#   # left_side = array[index].kind_of?(Array) ? array[index].sum : array[index]
#   left_side = index == 0 ? array[index] : array[0..index].sum
#   # # memo << [left_side - array[index+1..-1]].abs
#   memo << (left_side - array[index+1..-1].sum).abs
#   index += 1
# end.min
# # end
#

# (p_count..array.length)
# (0..array.length).each do |element|
# end

# Tape Equilibrium
# A non-empty array A consisting of N integers is given. Array A represents numbers on a tape. Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

# The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

# In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

# example: array = [3, 1, 2, 4, 3]
  # we can split this tape in four places:
  # - p = 1, diff = |3 - 10| = 7
  # - p = 2, diff = |4 - 9| = 5
  # - p = 3, diff = |6 - 7| = 1
  # - p = 4, diff = |10 - 3| = 7

# given array: = [3, 1, 2, 4, 3] -> should return 1 return the minimal diff that can be achieved

# assume:
  # n is int w/in rage of (2..100000)
  # each element of array A is an integer within the range [−1,000..1,000]  - huh? that includes P i think

# time complexity: worse-case O(n)
# space complexity: worse-case O(n) not including input storage


# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  (0..a.length-1).inject(Array.new) do |memo, index|
    left_sum = index == 0 ? a[index] : a[0..index].reduce(:+)
    right_sum = a[(index + 1)..-1].reduce(:+)
    memo << find_diff(left_sum, right_sum)
    memo
  end.min
end

def find_diff(left_sum, right_sum)
  (left_sum - right_sum).abs
end

# Example test:    [3, 1, 2, 4, 3]
# Output (stderr):
# exec.rb:14:in `-': nil can't be coerced into Fixnum (TypeError)
# 	from exec.rb:14:in `find_diff'
# 	from exec.rb:8:in `block in solution'
# 	from exec.rb:5:in `each'
# 	from exec.rb:5:in `inject'
# 	from exec.rb:5:in `solution'
# 	from exec.rb:121:in `<main>'
# RUNTIME ERROR  (tested program terminated with exit code 1)
#
# Detected some errors.'


# this garbage works
def solution(a)
  last_index = a.size - 1

  first_sum = a[0]
  last = a[1..-1]
  last_sum = last.reduce(:+)
  diff = calc_diff(first_sum, last_sum)
  return diff if a.length == 2
  (2..last_index).each do |p|
    first_sum += a[p-1]
    last_sum -= a[p-1]
    new_diff = calc_diff(first_sum, last_sum)
    if new_diff < diff
      diff = new_diff
    end
  end
  diff
end

def calc_diff(a,b)
  (a-b).abs
end
