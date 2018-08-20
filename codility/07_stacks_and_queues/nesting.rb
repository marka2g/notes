# my solution - 4 - 100%
# codity compiler suuuuucks
def solution(s)
  chars, stack_container = s.chars, []
  lefts, rights = ['(', 'V'], [')','W']

  # chars.each_with_index do |char, idx|
  chars.each do |char, idx|
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
# tests
# s = "())"
# s = '(()(())())'
# s = ")("
# s = ""
# s = "()()"
# s = "(())("
# solution(s)
