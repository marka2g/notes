# A non-empty array A consisting of N integers is given. The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).


# SORTING CLUE (0 ≤ P < Q < R < N)

# 3rd
# The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).
def solution(a)
  sorted_array, max_value, values = a.sort, a.sort.last, []

  # (0..sorted_array.length-1).each do |idx|
  sorted_array.each_with_index do |el, idx|
# binding.pry
    if idx >= max_value
      return values.max
    else
      values << triplet_value(sorted_array, idx)
    end
    # while idx < max_value
    #
    # end
  end
end

def triplet_value(arr, idx)
  arr[idx] * arr[idx+1] * arr[idx+2]
end

# 2nd attempt
# The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).
def solution(a)
  sorted_array, max_in_array, values = a.sort, a.sort.last, []

  (0..sorted_array.length-1).each do |idx|
binding.pry
    while idx < max_in_array
      return values.max if idx >= max_in_array
      # construct_triplet(sorted_array, idx)
      values << triplet_value(sorted_array, idx)
    end
  end
end

# def construct_triplet(arr, idx)
def triplet_value(arr, idx)
  arr[idx] * arr[idx+1] * arr[idx+2]
end


# def construct_triplet(arr, idx)
#   # [arr[idx], arr[idx+1], arr[idx+2]].inject(:*)
#   [arr[idx], arr[idx+1], arr[idx+2]]
# end



# 22%
def solution(a)
  combinations = a.sort.combination(3).to_a
  combinations.inject do |memo, ary|
    memo << ary.inject(:*)
    memo
  end.max
end
# test
# a = [-1, -10, 2, 3] -> 30
# a = [-3, 1, 2, -2, 5, 6] -> 60
# a = [-1, -2, -2, -5, -6]
# a = [-3, -1, -2, -2, -5, -6]
# a = [-3, 1, 2, -2, 5, 6]
# a = [-3, -1, 2, -2, -5, 6]
# a = [-3, -1, 2, -2, -5, 6]
# solution(a)

# example
# example test ✔OK
# expand allCorrectness tests
# ▶ one_triple
# three elements ✘WRONG ANSWER
# got 10 expected 1000
# 1. 0.040 s WRONG ANSWER,  got 10 expected 1000
# 2. 0.040 s WRONG ANSWER,  got -2 expected -80
# 3. 0.040 s WRONG ANSWER,  got 1000 expected 1000000000
# ▶ simple1
# simple tests ✔OK
# ▶ simple2
# simple tests ✘WRONG ANSWER
# got -6 expected -120
# ▶ small_random
# random small, length = 100 ✔OK
# 1. 0.172 s OK
# collapse allPerformance tests
# ▶ medium_range
# -1000, -999, ... 1000, length = ~1,000 ✘TIMEOUT ERROR
# running time: 4.48 sec., time limit: 0.16 sec.
# 1. 4.480 s TIMEOUT ERROR,  running time: 4.48 sec., time limit: 0.16 sec.
# stderr:
# exec.rb:5:in `combination'
# ▶ medium_random
# random medium, length = ~10,000 ✘TIMEOUT ERROR
# running time: 3.67 sec., time limit: 0.19 sec.
# 1. 3.668 s TIMEOUT ERROR,  running time: 3.67 sec., time limit: 0.19 sec.
# stderr:
# [FATAL] failed to allocate memory
# ▶ large_random
# random large, length = ~100,000 ✘TIMEOUT ERROR
# running time: 4.53 sec., time limit: 0.38 sec.
# 1. 4.528 s TIMEOUT ERROR,  running time: 4.53 sec., time limit: 0.38 sec.
# stderr:
# exec.rb:5:in `combination'
# ▶ large_range
# 2000 * (-10..10) + [-1000, 500, -1] ✘TIMEOUT ERROR
# running time: 3.38 sec., time limit: 0.26 sec.
# 1. 3.384 s TIMEOUT ERROR,  running time: 3.38 sec., time limit: 0.26 sec.
# stderr:
# [FATAL] failed to allocate memory
# ▶ extreme_large
# (-2, .., -2, 1, .., 1) and (MAX_INT)..(MAX_INT), length = ~100,000 ✘TIMEOUT ERROR
# running time: 4.55 sec., time limit: 0.34 sec.
# 1. 4.552 s TIMEOUT ERROR,  running time: 4.55 sec., time limit: 0.34 sec.
# stderr:
# exec.rb:5:in `combination'
# 2. 4.520 s TIMEOUT ERROR,  running time: 4.52 sec., time limit: 0.34 sec.
# stderr:
# exec.rb:5:in `combination'

# error -
# Compilation successful.
# Example test:    [-3, 1, 2, -2, 5, 6]
# WRONG ANSWER  (got 6 expected 60)
def solution(a)
  sorted_array = a.sort
  # # sorted_array.combination(3).to_a
  sorted_array.combination(3).each {|grp| grp.inject(:+)}.max
end

# error -
# Compilation successful.
# Example test:    [-3, 1, 2, -2, 5, 6]
# WRONG ANSWER  (got 6 expected 60)
def solution(a)
  sorted_array = a.sort
  sorted_array.permutation(3).each {|grp| grp.inject(:*) }.max
end

# 1st attempt - 44% -
# WRONG ANSWER,  got 84 expected 105
# WRONG ANSWER,  got 60 expected 120
def solution(a)
  sorted_array = a.sort
  # since its three, if all are negative, negative number is returned
  highest_three = sorted_array.last(3)
  max = highest_three.inject(:*)
end
# test
# a = [-3, 1, 2, -2, 5, 6]
# a = [-3, -1, 2, -2, -5, 6]

# mrhead's solution
def max_product_of_three(a)
  a.sort!

  # three biggest numbers
  tmp1 = a.last(3).inject(:*)

  # two smallest negative numbers and biggest positive number
  tmp2 = a[0] * a[1] * a[-1]

  [tmp1, tmp2].max
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 60, max_product_of_three([-3, 1, 2, -2, 5, 6])
  end

  def test_negative
    assert_equal 30, max_product_of_three([-1, -10, 2, 3])
  end

  def test_all_negative
    assert_equal -1, max_product_of_three([-1, -1, -1, -2])
  end

  def test_zero
    assert_equal 0, max_product_of_three([-1, -1, -1, 0])
  end
end


#Codility - from https://github.com/kumar91gopi/Algorithms-and-Data-Structures-in-Ruby/blob/master/codility/Sorting/MaxProductofThree.rb
def solution(a)
  a=a.sort
  len=a.size
  p1=(a[0]*a[1]*a[len-1])
  p2=(a[len-1]*a[len-2]*a[len-3])
  if p1>p2
      return p1
  else
      return p2
  end

end
