# 100%
def solution(s)
  s_to_chars_array, stack_array, enclosures = s.chars, [], {'{' => '}', '[' => ']', '(' => ')'}

  s_to_chars_array.each do |char|
    # check for opens
    if enclosures.keys.include?(char)
      # add open to stack
      stack_array << char
    else #its closed
      # pop open
      popped_open = stack_array.pop
      # check that popped open bracket is matched to its close - enclosures[popped] == '}'
      return 0 if mismatched_bracket?(enclosures[popped_open], char)
    end
  end

  # if remaining opens on stack, not valid
  !stack_array.empty? ? 0 : 1
end

def mismatched_bracket?(left, right)
  left != right
end
# manual tests
# solution('([)()]')
# solution('')
# solution('([)()]')
# solution('{[()()]}')
# solution('([()]){')
