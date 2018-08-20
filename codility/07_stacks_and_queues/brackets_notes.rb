# need a more specific include in the popped check... ie open_close[:opens] -> is Array v. pairs[stack.pop] is an O(1) lookup

# solution
def brackets(s)
  pairs = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }

  stack = []

  s.chars.each do |char|
    if pairs.keys.include?(char)
# binding.pry
      stack << char
    else
# binding.pry
      return 0 if pairs[stack.pop] != char
    end
  end
# binding.pry
  return 0 if stack.any?
  1
end

require 'minitest/autorun'

class Tests < MiniTest::Unit::TestCase
  def test_example_input
    assert_equal 1, brackets('{[()()]}')
  end

  def test_not_properly_nested
    assert_equal 0, brackets('([)()]')
  end

  def test_not_closed
    assert_equal 0, brackets('([()]){')
  end

  def test_empty_string
    assert_equal 1, brackets('')
  end

  def test_not_opened
    assert_equal 0, brackets(')()')
  end
end


# wkg

# NOPE
# enclosures = {open_sqig: '{', close_sqig: '}' open_brack: '[', close_brack: ']', open_paren: '(', close_paren: ')'}

# set won't work.  need an O(n) structure that returns the value -> pairs[stack.pop]
require 'set'

def solution(s)
  s_to_chars_array, stack_array = s.chars, []
  # open_close = {opens: SortedSet(['(', '[', '{']), closes: SortedSet([')', ']', '}'])}
  open_close = {opens: ['(', '[', '{'].to_set, closes: [')', ']', '}'].to_set}

  s_to_chars_array.each_with_index do |char, idx|
    # puts idx
    if open_close[:opens].include?(char)
      stack_array << char
    else
      popped = stack_array.pop
      return 0 if open_close[:opens]popped != char
    end
  end

  if stack_array.any?
    0
  else
    1
  end
end
# manual tests
# solution('([)()]')
# solution('')
# solution('([)()]')
# solution('{[()()]}')
# solution('([()]){')


require 'pry'
require 'minitest/autorun'

def solution(s)
  s_to_chars_array, stack_array = s.chars, []
  # left_rights = {'(' => ')', '[' => ']' ,'{' => '}'}
  open_close = {open: ['(', '[', '{'], close: [')', ']', '}']}

  s_to_chars_array.each do |char|
    if open_close[:open].include?(char)
      stack_array << char
    else
binding.pry
      # popped = left_rights[stack_array.pop]
      popped = stack_array.pop
      return 0 if open_close[:open].include?(popped) != open_close[:open].include?(char)
    end
  end
  # return 0 if stack_array.any?
  # 1
  if stack_array.any?
    0
  else
    1
  end
end
# manual tests
# solution('')
# solution('{[()()]}')
# solution('([)()]')







# need a more specific include in the popped check... ie open_close[:opens] -> is Array v. pairs[stack.pop] is an O(1) lookup
def solution(s)
  s_to_chars_array, stack_array = s.chars, []
  open_close = {opens: ['(', '[', '{'], closes: [')', ']', '}']}

  s_to_chars_array.each_with_index do |char, idx|
    puts idx
    if open_close[:opens].include?(char)
binding.pry
      stack_array << char
    else
binding.pry
      popped = stack_array.pop
      return 0 if open_close[:opens]popped != char
    end
  end
binding.pry

  if stack_array.any?
binding.pry
    0
  else
    1
  end
end
# manual tests
# solution('([)()]')


# solution('')
# solution('([)()]')
# solution('{[()()]}')
# solution('([()]){')

# this won't work because it wont catch the `in-betweens` i.e.
def solution(s)
  s_to_chars_array, stack_array = s.chars, []
  open_close = {opens: ['(', '[', '{'], closes: [')', ']', '}']}

  s_to_chars_array.each_with_index do |char, idx|
    puts idx
    if open_close[:opens].include?(char)
binding.pry
      stack_array << char
    else
binding.pry
      popped = stack_array.pop
      return 0 if open_close[:opens].include?(popped) && open_close[:opens].include?(char)
    end
  end
binding.pry

  if stack_array.any?
binding.pry
    0
  else
    1
  end
end
# manual tests
# solution('([)()]')

# solution('')
# solution('([)()]')
# solution('{[()()]}')
# solution('([()]){')


require 'pry'
require 'minitest/autorun'
class Tests < MiniTest::Unit::TestCase

  def test_hash_key_valid
    hsh = {'' => '‡'}
    assert_equal '‡', hsh['']
  end

  def test_empty_string
    assert_equal 1, solution('')
  end

  def test_example_input
    assert_equal 1, solution('{[()()]}')
  end

  def test_improperly_nested
    assert_equal 0, solution('([)()]')
  end

  def test_not_closed
    assert_equal 0, solution('([()]){')
  end

  def test_not_opened
    assert_equal 0, brackets(')()')
  end
end
