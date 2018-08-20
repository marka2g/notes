# O(n log n) Linearithmic Time - Merge Search - Recursive Function
class Linearithmic
  def initialize
  end

  def sort(arr)
    if arr.length <= 1
      arr
    else
      midway = (arr.length / 2).floor
      left = sort(arr[0..midway -1])
      right = sort(arr[midway..arr.length])
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end
end

# arr = [4, 1, 5, 1, 33, 312, 88, 6]
# la = Linearithmic.new
# p la.sort(arr)
