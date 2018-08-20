# Odd Occurences in Array

# given -> array = [9, 3, 9, 3, 9, 7, 9]
# write a method that returns the unpaired element -> 7

# 5th attempt - 66% again...
def solution(array)
  array.each.inject(Hash.new(0)) do |memo, num|
    memo.store(num, memo[num]+1) if num
    memo
  end.key(1)
end
# def solution(array)
#   array.each.inject(Hash.new(0)) do |memo, num|
#     memo.store(num, memo[num]+1) unless num.nil?
#     memo
#   end.key(1)
# end
# Test
# array = [39, 2, 39, 55, 2, 201, 39, 2001, 201, 39, 55]
# array = [39, 2, 39, 55, 2, 39, 9834242, 39, 55]
# array = [9, 3, 9, 3, 9, 7, 9]
# array = [7, 3, 7, 3, 7, 7, 9]
# array = [4242, 39, 2, 39, 55, 2, 39, 39, 55]
  # {4242=>1, 39=>4, 2=>2, 55=>2}
# solution(array)

# 4th attempt - 44% - wtf
def solution(array)
  array.each.inject(Hash.new(0)) do |memo, num|
    memo.store(num, memo[num]+1)
    memo.delete_if { |k, v| v.nil? || k.nil? }
  end.key(1)
end
# Test
# array = [9834242, 39, 2, 39, 55, 2, 39, 39, 55]
# array = [9, 3, 9, 3, 9, 7, 9]
# array = [7, 3, 7, 3, 7, 7, 9]
# array = [4242, 39, 2, 39, 55, 2, 39, 39, 55]
  # {4242=>1, 39=>4, 2=>2, 55=>2}
# solution(array)

# 3nd attempt - 66% again...  boo
def solution(array)
  array.each.inject(Hash.new(0)) do |memo, num|
    memo.store(num, memo[num]+1)
    memo
  end.key(1)
end
# Test
# array = [9834242, 39, 2, 39, 55, 2, 39, 39, 55]
# array = [9, 3, 9, 3, 9, 7, 9]
# array = [7, 3, 7, 3, 7, 7, 9]
# array = [4242, 39, 2, 39, 55, 2, 39, 39, 55]
  # {4242=>1, 39=>4, 2=>2, 55=>2}
# solution(array)

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_outlandish_num
    assert_equal 9834242, solution([9834242, 39, 2, 39, 55, 2, 39, 39, 55])
  end

  def test_four_two_one
    assert_equal 7, solution([9, 3, 9, 3, 9, 7, 9])
  end
end


# 2nd attempt - 66%
def solution(array)
  array.each.inject(Hash.new(0)) do |memo, num|
    memo.store(num, memo[num]+1)
    memo
  end.select { |k, v| k if v == 1 }.keys[0]
end
# Test
# array = [9, 3, 9, 3, 9, 7, 9]
# array = [7, 3, 7, 3, 7, 7, 9]
# array = [4242, 39, 2, 39, 55, 2, 39, 39, 55]
  # {4242=>1, 39=>4, 2=>2, 55=>2}
# solution(array)

# 1st attempt 44%
# small1
# small random test n=201 ✘WRONG ANSWER
# got 23 expected 42
# 1. 0.040 s WRONG ANSWER,  got 23 expected 42
# ▶ small2
# small random test n=601 ✘WRONG ANSWER
# got 1411 expected 4242
# 1. 0.040 s WRONG ANSWER,  got 1411 expected 4242
# PERF
# ▶ medium1
# medium random test n=2,001 ✔OK
# 1. 0.040 s OK
# ▶ medium2
# medium random test n=100,003 ✘WRONG ANSWER
# got 4195 expected 500000
# 1. 0.112 s WRONG ANSWER,  got 4195 expected 500000
# ▶ big1
# big random test n=999,999, multiple repetitions ✘WRONG ANSWER
# got 161 expected 700
# 1. 0.612 s WRONG ANSWER,  got 161 expected 700
# ▶ big2
# big random test n=999,999 ✘WRONG ANSWER
# got 673436396 expected 500111222
# 1. 1.124 s WRONG ANSWER,  got 673436396 expected 500111222

def solution(array)
  array.each.inject(Hash.new(0)) do |memo, num|
    memo.store(num, memo[num]+1)
    memo
  end.keys[-1]
end
# Test
# array = [9, 3, 9, 3, 9, 7, 9]
# array = [7, 3, 7, 3, 7, 7, 9]
# solution(array)

# def solution(array)
#   # array.uniq.each.inject({}) do |memo, num|
#   #   memo.merge({num.to_s => 0})
#   # end
#   # # memo = {"9"=>0, "3"=>0, "7"=>0}
#
#   array.each.inject({}) do |memo, num|
#     memo.merge({num.to_s => 0})
#     array.each do |number|
#       memo[number.to_s]
#     end
#     memo[num.to_s] = count += 1
#   end
#   # memo = {"9"=>0, "3"=>0, "7"=>0}
#
# end

# el_counts = array.uniq.inject({}) { |memo, num| memo[num] = 0 }
# def solution(array)
#   array.map do |el|
#     count = 0
#     el_counts[el.to_s] = count += 1
#   end
# end
