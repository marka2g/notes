
# {}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}

# PRACTICE TEST
3. 100% use an unsorted Set - no need to sort

require 'set'
def solution(a)
  set = a.to_set
  num = 1

  while set.include? num
    num += 1
  end
  num
end
#  array  = [1, 3, 6, 4, 1, 2]
# solution(array)

2. use a Set 77%

require 'set'
def solution(a)
  set = a.to_set.sort
  num = 1

  while set.include? num
    num += 1
  end
  num
end
#  array  = [1, 3, 6, 4, 1, 2]
# solution(array)

1. %11 out of %100 - YIKES!

# array_set = [1, 2, 3, 4, 5, 6, 8, 9, 10].sort.uniq
# array_set = [1, 2, 4, 5, 6, 7].sort.uniq
# array_set = [-1, -3].sort.uniq
# array_set = [1, 2, 3].sort.uniq
# array_set = (1..100000).to_a.sort.uniq
# array_set = [2].sort.uniq
# solution(array_set)
def solution(a)
  a = a.sort.uniq
  return smallest_positive(a.last) if a.length <= 1 || a.last < 0
  first, second = a[0], a[1]

  if first + 2 == second
    return first + 1
  else
    solution(a[1..a[-1]])
  end
end

def smallest_positive(num)
  num < 0 ? 1 : num + 1
end

# array_set = [1, 2, 3, 4, 5, 6, 8, 9, 10].sort.uniq
# array_set = [1, 2, 4, 5, 6, 7].sort.uniq
# array_set = [-1, -3].sort.uniq
# array_set = [2].sort.uniq
def solution(arr)
  return arr.last + 1 if arr.length <= 1
  first, second = arr[0], arr[1]
  if arr.last < 0
    return 1
  elsif first + 2 == second
    return first + 1
  else
    solution(arr[1..arr[-1]])
  end
end
# solution(array_set)


# This is a demo task.
#
# Write a function:
#
# def solution(a)
#
# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
#
# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
#
# Given A = [1, 2, 3], the function should return 4.
#
# Given A = [−1, −3], the function should return 1.
#
# Assume that:
#
# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N) (not counting the storage required for input arguments).

arr_one = [1, 3, 6, 4, 1, 2]
arr_two = [-1, -3]

arr_one.sort.uniq
arr_two.sort.uniq


# >>
arr_one.sort.uniq[0..1][0] + 1 == arr_one.sort.uniq[0..1][1]
# => true
# >>
arr_one.sort.uniq[1..2][0] + 1 == arr_one.sort.uniq[1..2][1]
# => true
# >>
arr_one.sort.uniq[2..3][0] + 1 == arr_one.sort.uniq[2..3][1]
# => true
# >>
arr_one.sort.uniq[3..4][0] + 1 == arr_one.sort.uniq[3..4][1]
# => false

# array_set = [1, 2, 3, 4, 5, 6, 8, 9, 10].sort.uniq
# array_set = [1, 2, 4, 5, 6, 7].sort.uniq
# array_set = [-1, -3].sort.uniq
def solution(arr)
  # should_return = arr.length <= 1 || arr.last
  # arr.last < 0
  return arr.last + 1 if arr.length <= 1
  first, second = arr[0], arr[1]
  if first + 2 == second
    return first + 1
  else
    solution(arr[1..arr[-1]])
  end
end
# solution(array_set)

# array_set = arr_one.sort.uniq
def solution(array_set)
  return if array_set.empty?
  first, second = array_set[0], array_set[1]
binding.pry
  if first + 1 < second
    return first + 1
  else
    solution(array_set[first.index..second.index])
  end
end
# solution(array_set)


def fib(times_to_fib)
  if times_to_fib < 2
    times_to_fib
  else
    fib(times_to_fib - 1) + fib(times_to_fib - 2)
  end
end
# puts fib(10)


(0..a.sort.uniq.length).step(2) do |first, second|
  if first == second - 1
    next
  else

  end
end

a = [1, 3, 6, 4, 1, 2]


# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  #a.sort.uniq.each do |num|
  #end
  #.take_while
  a.sort.uniq.each_with_index do |item, index|
    if item  index
  end
end


def smallest_positive(one, two)
  true if two = one + 1
end


# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  a.sort.uniq.each_with_index do |item, index|
    if item == a[index +1] -1
      item + 1
    end
  end
end


def smallest_positive(one, two)
  true if two = one + 1
end



# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  a.sort.uniq.each_with_index do |item, index|
    if item == a[index +1] -1
      item + 1
    end
  end
end

def smallest_positive(one, two)
  true if two = one + 1
end
