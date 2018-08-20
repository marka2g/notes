# Cyclic Rotation

# for Array of 'n' ints, shift elements right, 'k' times
# eg k = 1
# [3, 8, 9, 7, 6] -> [8, 9, 7, 6, 3]

# 1st attempt, iterative - 87%
def solution(array, rotations)
  rotations.times do
    array.unshift(array.pop)
  end
  array
end
# tests
# array = [3, 8, 9, 7, 6]
# rotations = 3
# solution(array, rotations)

# def solution(array, rotations)
#   # array.each.inject([]) do |memo, num|
#   #   rotations.times do
#   #     back = array.shift()
#   #     memo << [array.shift()].push(back)
#   #   end
#   # end
#
#   rotations.times do
#     back = array.shift()
#     array.push(back)
#   end
# end



# 2st attempt, recursive
# base case = rotations
