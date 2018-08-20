def sort(list)
  # base case
  if list.length <= 1
    list
  else
    midway = (list.length / 2).floor
    # create a recursive stack
    left = sort(list[0..midway - 1])
    right = sort(list[midway..list.length])
    merge(left, right)
  end
end

def merge(left, right)
  # base case
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    # recursively call merge & return another array
    # we need this in brackets because we're adding this to another array.
    # eg: left = [1, 1, 3, 4] and right = [100, 101, 102]
    #newly_left_merged = [1] + [1] + [3] + [4]
    [left.first] + merge(left[1..left.length], right)
  else
    # we don't even need the elsif, theres only one other option
    [right.first] + merge(left, right[1..right.length])
  end
end

arr = [4, 1, 5, 1, 33, 312]
p sort(arr)
