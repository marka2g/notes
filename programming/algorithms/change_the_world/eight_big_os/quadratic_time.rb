# O(n^2) Quadratic Time - Loop in a Loop
class QuadraticTime
  attr_reader :array

  def initialize(unsorted_array)
    @array = unsorted_array
  end

  def has_duplicates?
    total_loop_counter = 0
    @array.each do |outer_item|
      @array.each do |inner_item|
        total_loop_counter += 1
        next if outer_item === inner_item
        return true if @array[outer_item] === @array[inner_item]
      end
    end
    puts "Size of input_array = #{@array.length} and Cost = #{total_loop_counter}🍔s"
    false
  end

  def bubble_sort
    @array.each_with_index do |outer_element, outer_index|
      @array.each_with_index do |inner_element, inner_index|
        if outer_element < inner_element
          # swap
          @array[outer_index], @array[inner_index] = inner_element, outer_element
          # update_references
          outer_element, inner_element = @array[outer_index], @array[inner_index]
        end
      end
    end
    @array
  end

end

# runit
# qt = QuadraticTime.new([2, 8, 3, 5, 24, 3, 8, 3])
# qt.has_duplicates?
# qt = QuadraticTime.new([77, 6, 3, 8, 44, 26, 77, 12, 2, 1].uniq)
# qt.bubble_sort

# # with forever loop
# def bubble_sort(array)
#   n = array.length
#   loop do
#     swapped = false
#
#     (n-1).times do |i|
#       if array[i] > array[i+1]
#         array[i], array[i+1] = array[i+1], array[i]
#         swapped = true
#       end
#     end
#     break if not swapped
#   end
#   array
# end
