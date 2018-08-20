# An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
# eg array = [2, 3, 1, 5] returns 4

require 'set'

def solution(a)
  set = a.to_set
  num = 1

  while set.include? num
    num += 1
  end
  num
end

# test
# a = [2, 3, 1, 5]
# solution(a)
