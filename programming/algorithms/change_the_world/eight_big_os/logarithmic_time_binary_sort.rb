# O(log n) Logarithmic Time - Binary Search
class LogarithmicTime
  def initialize
  end
  def index_of(array, element, offset = 0)
    half = (array.length / 2).to_int
    current = array[half]

    if current == element
      return offset + half
    elsif element > current
      # right = array.slice(half..-1)
      right = array.slice(half)
      index_of(right, element, offset + half)
    else
      # left = array.slice(0..half)
      left = array.slice(0, half)
      index_of(left, element, offset)
    end
  end
end

# friends = ['Kevin', 'Alex', 'Stuart', 'Michael', 'Davy', 'Stanley', 'Mike', 'Hau', 'Jeremy', 'Lolo', 'Ryan'].sort
# lt = LogarithmicTime.new
# lt.index_of(friends, 'Davy')
# lt.index_of(friends, 'Kevin')
# lt.index_of(friends, 'Stuart')
