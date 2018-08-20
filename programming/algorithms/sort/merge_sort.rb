def sort(a)
  return a if a.size <= 1

  mid = a.size / 2
  left, right = a[0...mid], a[mid..-1]
puts "RECURSE SORT sort(array: #{a})\n left: #{left} right: #{right}"

  merge(sort(left), sort(right))
end

def merge(left, right)
  bucket = []
puts "MERGE merge(left: #{left}, right: #{right})"

  while left.any? || right.any?
    if left.any? && right.any?
      if left.first <= right.first
puts "first left(#{left.first}) is less, put it in the bucket"
        bucket << left.shift
      else
puts "first right(#{right.first}) is less, put it in the bucket"
        bucket << right.shift
      end
    elsif left.any?
      bucket << left.shift
    elsif right.any?
      bucket << right.shift
    end
  end
  bucket
end

# Tests
a = [7, 6, 44, 9, 3, 1]
a = %w[z, f, w, d, t, e, h, k]
result = sort(a)



# def sort_one(a)
#   return a if a.size <= 1
#
#   mid_point = a.size / 2
#   left, right = a[0...mid_point], a[mid_point..-1]
# puts "SORT RECURSE sort(array: #{a})\n left: #{left} right: #{right}"
#
#   left = sort(left)
#   right = sort(right)
#
#   merge_one(left, right)
# end
#
# def merge_one(left, right)
#   bucket = []
#   puts "MERGE merge(left: #{left}, right: #{right})"
#
#   while left.any? || right.any?
#     if left.any? && right.any?
#       if left.first <= right.first
#         puts "first left(#{left.first}) is less, put it in the bucket"
#         bucket << left.shift
#       else
#         puts "first right(#{right.first}) is less, put it in the bucket"
#         bucket << right.shift
#       end
#     elsif left.any?
#       puts "left(#{left.first}) is left over, put it in the bucket"
#       bucket << left.shift
#     elsif right.any?
#       puts "right(#{right.first}) left is left over, put it in the bucket"
#       bucket << right.shift
#     end
#   end
# puts "returned bucket: #{bucket}"
#   bucket
# end
#
#
# a = [7, 6, 44, 9, 3, 1]
# result = sort_one(a)
# # SORT RECURSE sort(array: [7, 6, 44, 9, 3, 1])
# #  left: [7, 6, 44] right: [9, 3, 1]
# # SORT RECURSE sort(array: [7, 6, 44])
# #  left: [7] right: [6, 44]
# # SORT RECURSE sort(array: [6, 44])
# #  left: [6] right: [44]
# # MERGE merge(left: [6], right: [44])
# # first left(6) is less, put it in the bucket
# # right(44) left is left over, put it in the bucket
# # returned bucket: [6, 44]
# # MERGE merge(left: [7], right: [6, 44])
# # first right(6) is less, put it in the bucket
# # first left(7) is less, put it in the bucket
# # right(44) left is left over, put it in the bucket
# # returned bucket: [6, 7, 44]
# # SORT RECURSE sort(array: [9, 3, 1])
# #  left: [9] right: [3, 1]
# # SORT RECURSE sort(array: [3, 1])
# #  left: [3] right: [1]
# # MERGE merge(left: [3], right: [1])
# # first right(1) is less, put it in the bucket
# # left(3) is left over, put it in the bucket
# # returned bucket: [1, 3]
# # MERGE merge(left: [9], right: [1, 3])
# # first right(1) is less, put it in the bucket
# # first right(3) is less, put it in the bucket
# # left(9) is left over, put it in the bucket
# # returned bucket: [1, 3, 9]
# # MERGE merge(left: [6, 7, 44], right: [1, 3, 9])
# # first right(1) is less, put it in the bucket
# # first right(3) is less, put it in the bucket
# # first left(6) is less, put it in the bucket
# # first left(7) is less, put it in the bucket
# # first right(9) is less, put it in the bucket
# # left(44) is left over, put it in the bucket
# # returned bucket: [1, 3, 6, 7, 9, 44]
#
#
#
#
# result = sort(a)
# # SORT RECURSE sort(array: [7, 6, 44, 1, 3, 9])
# #  left: [7, 6, 44] right: [1, 3, 9]
# # SORT RECURSE sort(array: [7, 6, 44])
# #  left: [7] right: [6, 44]
# # SORT RECURSE sort(array: [6, 44])
# #  left: [6] right: [44]
# # MERGE merge(left: [6], right: [44])
# # returned bucket: [6, 44]
# # MERGE merge(left: [7], right: [6, 44])
# # returned bucket: [6, 7, 44]
# # SORT RECURSE sort(array: [1, 3, 9])
# #  left: [1] right: [3, 9]
# # SORT RECURSE sort(array: [3, 9])
# #  left: [3] right: [9]
# # MERGE merge(left: [3], right: [9])
# # returned bucket: [3, 9]
# # MERGE merge(left: [1], right: [3, 9])
# # returned bucket: [1, 3, 9]
# # MERGE merge(left: [6, 7, 44], right: [1, 3, 9])
# # returned bucket: [1, 3, 6, 7, 9, 44]
#
#
#
# # def merge(left, right)
# #   bucket = []
# #   puts "MERGE merge(left: #{left}, right: #{right})"
# #
# #   while left.any? || right.any?
# #     if left.any? && right.any?
# #       if left.first <= right.first
# #         puts "first left(#{left.first}) is less, put it in the bucket"
# #         # bucket << left.unshift  WRONG!!! unshift prepends to front
# #         bucket << left.shift #=> pops first off & returns it
# #       else
# #         puts "first right(#{right.first}) is less, put it in the bucket"
# #         # bucket << right.unshift WRONG!!! unshift prepends to front
# #         bucket << right.shift #=> pops first off & returns it
# #       end
# #     elsif left.any?
# #       puts "left(#{left.first}) is left over, put it in the bucket"
# #       # bucket << left.unshift #WRONG!!! unshift prepends to front
# #       bucket << left.shift #WRONG!!! unshift prepends to front
# #     elsif right.any?
# #       puts "right(#{right.first}) left is left over, put it in the bucket"
# #       # bucket << right.unshift #WRONG!!! unshift prepends to front
# #       bucket << right.shift #WRONG!!! unshift prepends to front
# #     end
# #   end
# # puts "returned bucket: #{bucket}"
# #   bucket
# # end
