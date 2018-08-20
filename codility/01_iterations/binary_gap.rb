# 100%
def binary_gap(n)
  gaps = n.to_s(2).split('1')
  gaps.pop if n % 2 == 0
  return 0 if gaps.empty?
  gaps.map {|bg| bg.length }.max
end
# tests
# n = 32
# n = 1041
# binary_gap(n)

# def solution(n)
#   binary_array = n.to_s(2).split(/1(0+)(?=1)/)
# end

# https://github.com/mrhead/codility/blob/3508024e5fe99149503fbeee85e0e897262f8ccb/binary_gap.rb
def binary_gap(n)
binding.pry
  s = '%b' % n
  zeroes = s.split('1')
  zeroes.pop if n % 2 == 0
  return 0 if zeroes.empty?
  zeroes.map { |zeroes| zeroes.length }.max
end

# tests
# n = 32
# n = 1041
# binary_gap(n)

"10000010000".split(/1(0+)(?=1)/)

def binary_gap(num)
# binding.pry
  # binary = num.to_s(2).split('1')
  binary = num.to_s(2)

  # valid = binary[-1] == "1"
  # gaps = binary.split('1') if binary[-1] == "1"

  return 0 if binary.empty? || binary.kind_of?(String)
  binary.max.length
end

# tests
# num = 32
# num = 1041
# binary_gap(num)

# 32.to_s(2) # 100000
# 1041.to_s(2) # 10000010001

"100000".split()

"10000010001"
# v
"10000010000"

# "10000010000".split(/\A1{1}0*1{1}\z/)
# "10000010001".split(/\A1{1}0*1{1}\z/)
"10000010000".split(/10*/, 1)
"10000010001".split(//)

"10000010001".split('1')


"10000010000".scan(/10*1/)
"1000000010000".scan(/10*1/)[0].split('1')

"1000000010000000000001".scan(/10*1/)[0].split('1')

"1000000010000000000001".split('1')

# binary = /1/.match "100000"

def binary_gap_from_array(array_of_nums)
  max_gap = [0, 0]
  array_of_nums.to_a.each do |num|
    binary = num.to_s(2).split('1')
    next if binary.empty? || binary.kind_of?(String)
    gaps = binary.max.length
    if gaps > 1 && gaps > max_gap[0]
      max_gap[0], max_gap[1] = gaps, num
    end
  end
  max_gap[0]
end
# nums = (1..10).to_a
# binary_gap(nums)



# # binding.pry
# def binary_gap(array_of_nums)
#   array_of_nums.to_a.each do |num|
#     next if num.to_s(2).split('1').empty?
#     if
#
#     end
#     gaps = num.to_s(2).split('1')
#     unless num.to_s(2).split('1').empty?
#       # counts << [gaps.max, num] if gaps.max > counts[0][0]
#       # counts << [gaps.max.length, num] if gaps.max.length > 1 && gaps.max > counts[0][0].length
#
#
#     end
#   end
# end

# possible constraints
# 1. num.to_s(2) NOPE: 532.to_s(2) #=> "1000010100" gap 4
# 2. next if num % 2 >= 1 NOPE: 9.to_s(2) #=> "1001" gap 2
# 3 count '1's in binary.  '1's > 1

# # nums = (1..10).to_a
# (1..10).to_a.each do |num|
#   # counts = {}
#   counts = []
#   longest_gap = num.to_s(2).split('1').max.length
#   if gaps.count > 1
#     # counts[longest_gap.to_sym: num]
#     # num.to_s.to_sym
#     counts << [gaps, num] if gaps > counts[0][0]
#   end
# end


# binary conversions

# binary to int
  # "100100000010001".to_i(2)
# int to binary
  # num.to_s(2)

# num.to_enum(:scan, /10+1/).map {Regexp.last_match(0)}

# regex
string = 'The quick 12 brown foxes jumped over the 10 lazy dogs'
p string =~ /o/
# => 15 -> 'o' is at 15 index
p string =~ /quick/
# => 4
p string =~ /z/ ? 'valid' : 'invalid'
p string =~ /z/i ? 'valid' : 'invalid'

# range
p string =~ /[a-zA-Z]/ ? 'valid' : 'invalid'

# return all of the matches that are integers - find all ints
# not only find it but return it
p string.to_enum(:scan, /\d+/).map {Regexp.last_match}


# 100
def solution(N):
  # write your code in Python 2.7
  b = [len(x) for x in "{0:b}".format(N).rstrip('0').lstrip('0').split('1')]
  b.sort()
  return b[-1]

def solution(n)
  # binary = n.to_s(2).split('1')
  # return 0 if binary.empty? || binary.kind_of?(String)
  # binary.max.length
  binary = n.to_s(2)
end

def binary_gap_from_array(array_of_nums)
  max_gap = [0, 0]
  array_of_nums.to_a.each do |num|
    binary = num.to_s(2).split('1')
    next if binary.empty? || binary.kind_of?(String)
    gaps = binary.max.length
    if gaps > 1 && gaps > max_gap[0]
      max_gap[0], max_gap[1] = gaps, num
    end
  end
  max_gap[0]
end


def binary_gap(num)
# binding.pry
  # binary = num.to_s(2).split('1')
  binary = num.to_s(2)

  # valid = binary[-1] == "1"
  # gaps = binary.split('1') if binary[-1] == "1"

  return 0 if binary.empty? || binary.kind_of?(String)
  binary.max.length
end




# blah
# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
  # binary_array = n.to_s(2).split(/1(0+)(?=1)/)

  # return 0 if binary_array.empty? || binary_array.kind_of?(String)
  # binary.max.length


  binary_array = n.to_s(2).split(/1(0+)(?=1)/)
  binary_array.max.length
end


def binary_gap(n)
  s = '%b' % n
  zeroes = s.split('1')
  zeroes.pop if n % 2 == 0
  return 0 if zeroes.empty?
  zeroes.map { |zeroes| zeroes.length }.max
end
