# "(()(())())"
# ["(", "(", ")", "(", "(", ")", ")", "(", ")", ")"]
# ["ADD", "ADD", "SKIP/POP", "ADD", "ADD", "SKIP/POP", "SKIP/POP", "ADD", "SKIP/POP", "SKIP/POP"]

# stack_array: []  count: 0  char: '(', -> ADD
  # stack_array: ["("]  count: 1  char: '(', -> ADD
    # stack_array: ["(", "("]  count: 2  char: ')', -> SKIP & POP
      # stack_array: ["("]  count: 3  char: '(' -> ADD
        # stack_array: ["(", "("]  count: 4  char: '(', -> ADD
          # stack_array: ["(", "(", "("]  count: 5  char: ), -> SKIP & POP
            # stack_array: ["(", "("]  count: 6  char: ), -> SKIP & POP
              # stack_array: ["("]  count: 7  char: (, ADD
                # stack_array: ["(", "("]  count: 8  char: ), -> SKIP & POP
                  # stack_array: ["("]  count: 9  char: ), -> SKIP & POP
                    # 1

# my solution - 4 - 100%
# codity compiler suuuuucks
def solution(s)
  chars, stack_container = s.chars, []
  lefts, rights = ['(', 'V'], [')','W']

  chars.each_with_index do |char, idx|
    if lefts.include?(char)
      stack_container << char
    else
      #return 0 if stack_container.pop != lefts.any?
      popped = stack_container.pop
      return 0 if popped != '('
    end
  end
  stack_container.empty? ? 1 : 0
end


# my solution - 3
def solution(s)
  chars, stack_container = s.chars, []
  lefts, rights = ['(', 'V'], [')','W']

  chars.each_with_index do |char, idx|
    if lefts.include?(char)
      stack_container << char
    else
      return 0 if stack_container.pop != lefts.any?
    end
  end
  stack_container.empty? ? 1 : 0
end
# tests
# s = "())"
# s = '(()(())())'
# s = ")("
# s = ""
# s = "()()"
# s = "(())("
# solution(s)


# my solution - 3
def solution(s)
  chars, stack_container = s.chars, []
  # lefts, rights = %w[( V], %w[) W]
  lefts, rights = ['(', 'V'], [')','W']

  chars.each do |char|
binding.pry
    if lefts.include?(char)
binding.pry
      stack_container << char
    else
binding.pry
      return 0 if rights.include?(stack_container.pop)
    end
  end
binding.pry
  stack_container.empty? ? 1 : 0
end
# tests
# s = '(()(())())'
# s = "())"
# s = ")("
# s = ""
# s = "()()"
# s = "(())("
# solution(s)

#
def solution(s)
  chars, stack_container = s.chars, []
  lefts, rights = ['(', 'V'], [')','W']

  chars.each_with_index do |char, idx|
    if lefts.include?(char)
      stack_container << char
    else
      # removed = stack_container.pop
      # return 0 unless removed.nil? || rights.include?(removed)
      return 0 if stack_array.pop != lefts.any?
    end
  end
  stack_container.empty? ? 1 : 0
end



# my solution - 3 - WRONG!  need a stack - []
# The following issues have been detected: wrong answers, timeout errors.
# For example, for the input ')(' the solution returned a wrong answer (got 1 expected 0).

def solution(s)
  nested_string = s.chars
  left_count, right_count, left_char, right_char = 0, 0, '(', ')'
  nested_string.each do |char|
    char == left_char ? left_count += 1 : right_count += 1
  end
  if left_count == right_count
    1
  else
    0
  end
end
# test
# s = "(()(())())"
# s = "())"
# s = ")("
# s = ""
# s = "()()"
# s = "(())("
# solution(s)

# my solution - 2 separate & count - 12%
def solution(s)
  nested_string = s.each_char.to_a
  return 0 if nested_string.length < 2
  left, right = 0, 0
  nested_string.each do |char|
    char == '(' ? left += 1 : right += 1
  end
  if left == right
    1
  else
    0
  end
end
# test
# s = "(()(())())"
# s = "())"
# s = ""
# s = "()()"
# s = "(())("
# solution(s)

# my solution
# require 'set'
# def solution(s)
#   nested_string = s.each_char.to_a
#   set = nested_string.to_set
# binding.pry
#   if nested_string.size / set.length == nested_string.size / 2
#     1
#   else
#     0
#   end
# end
# test
# s = "(()(())())"
# s = "())"
# s = ""
# s = "()()"
# s = "(())("
# solution(s)


def solution(s)
  nested_string = s.each_char.to_a
  stack_array = []

  count = 0
  nested_string.each do |char|
    puts "stack_array: #{stack_array}  count: #{count}  char: #{char}"
binding.pry
    if char == '('
      stack_array << char
    else
      return 0 if stack_array.pop != '('
    end
    count += 1
  end
  stack_array.empty? ? 1 : 0
end
# test
# s = "(()(())())"
# s = "())"
# s = ""
# s = "()()"
# s = "(())("
# solution(s)

# watch count
# watch nested_string
# watch stack_array
# watch char
# exit

# my solution - 2 separate & count - 12%
# The following issues have been detected: wrong answers, timeout errors.
# For example, for the input ')(' the solution returned a wrong answer (got 1 expected 0).
require 'set'
def solution(s)
  nested_string = s.chars
  left, right, set = 0, 0, nested_string.to_set
  nested_string.each do |char|
    char == set.first ? left += 1 : right += 1
  end
  if left == right
    1
  else
    0
  end
end

# test
# s = "(()(())())"
# s = "())"
# s = ""
# s = "()()"
# s = "(())("
# solution(s)


# my solution
# require 'set'
# def solution(s)
#   nested_string = s.each_char.to_a
#   set = nested_string.to_set
# binding.pry
#   if nested_string.size / set.length == nested_string.size / 2
#     1
#   else
#     0
#   end
# end
# test
# s = "(()(())())"
# s = "())"
# s = ""
# s = "()()"
# s = "(())("
# solution(s)


# # 1st attempt - 12%
# ▶ example1
# example test ✔OK
# ▶ example2
# example test2 ✔OK
# expand allCorrectness tests
# ▶ negative_match
# invalid structure, but the number of parentheses matches ✘WRONG ANSWER
# got 1 expected 0
# ▶ empty
# empty string ✔OK
# ▶ simple_grouped
# simple grouped positive and negative test, length=22 ✘WRONG ANSWER
# got 1 expected 0
# 1. 0.040 s OK
# 2. 0.040 s OK
# 3. 0.040 s WRONG ANSWER,  got 1 expected 0
# ▶ small_random ✘WRONG ANSWER
# got 1 expected 0
# 1. 0.040 s WRONG ANSWER,  got 1 expected 0
# 2. 0.040 s OK
# 3. 0.040 s WRONG ANSWER,  got 1 expected 0
# collapse allPerformance tests
# ▶ large1
# simple large positive and negative test, 10K or 10K+1 ('s followed by 10K )'s ✘WRONG ANSWER
# got 1 expected 0
# 1. 0.048 s OK
# 2. 0.048 s OK
# 3. 0.040 s WRONG ANSWER,  got 1 expected 0
# ▶ large_full_ternary_tree
# tree of the form T=(TTT) and depth 11, length=177K+ ✘WRONG ANSWER
# got 1 expected 0
# 1. 0.108 s OK
# 2. 0.040 s WRONG ANSWER,  got 1 expected 0
# ▶ multiple_full_binary_trees
# sequence of full trees of the form T=(TT), depths [1..10..1], with/without unmatched ')' at the end, length=49K+ ✘WRONG ANSWER
# got 1 expected 0
# 1. 0.060 s OK
# 2. 0.060 s OK
# 3. 0.040 s WRONG ANSWER,  got 1 expected 0
# ▶ broad_tree_with_deep_paths
# string of the form (TTT...T) of 300 T's, each T being '(((...)))' nested 200-fold, length=1 million ✘WRONG ANSWER
# got 1 expected 0
# 1. 0.408 s OK
# 2. 0.040 s WRONG ANSWER,  got 1 expected 0

def solution(s)
  nested_string = s.each_char.to_a
  stack_array = []

  count = 0
  nested_string.each do |char|
    puts "stack_array: #{stack_array}  count: #{count}  char: #{char}"
binding.pry
    if char == '('
      stack_array << char
    else
      return 0 if stack_array.pop != '('
    end
    count += 1
  end
  stack_array.empty? ? 1 : 0
end
# test
# s = "(()(())())"
# s = "())"
# s = ""
# s = "()()"
# s = "(())("
# solution(s)



# check
def solution(s)
  nested_string = s.each_char.to_a
  stack_array = []

  nested_string.each do |char|
    ## stack_array << char if char == '('
    ## return 0 if stack_array.pop != '('

    # if char == '('
    #   stack_array.push(char)
    # else
    #   return 0 if stack_array.pop != '('
    # end
    stack_array.push(char) if char == '('
    return 0 if stack_array.pop != '('
  end
  stack_array.empty? ? 1 : 0
end

# my solution - 3
def solution(s)
  chars, stack_container = s.chars, []
  lefts, rights = ['(', 'V'], [')','W']

  chars.each do |char|
    if lefts.include?(char)
      stack_container << char
    else
      # return 0 unless stack_container.pop.include?(char)
      removed = stack_container.pop
      return 0 unless rights.include?(removed)
    end
  end
  stack_container.empty? ? 1 : 0
end

# pop - removes the last element from self and returns it
# s.each_char.to_a[0] || shorthand: s.chars
def nesting(s)
  stack = []
  s.chars.each do |char|
    if char == '('
      stack << char
    else
      return 0 if stack.pop != '('
    end
  end
  stack.empty? ? 1 : 0
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, nesting('(()(())())')
  end

  def test_example_fail
    assert_equal 0, nesting('())')
  end

  def test_empty
    assert_equal 1, nesting('')
  end

  def test_success
    assert_equal 1, nesting('()()')
  end

  def test_not_closed
    assert_equal 0, nesting('(())(')
  end
end
