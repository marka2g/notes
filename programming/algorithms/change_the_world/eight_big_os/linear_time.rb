# O(n) Linear Time
class LinearTime
  def initialize
  end

  def largest_unsorted_item(array)
    max, counter = 0, 0

    array.each do |element|
      counter += 1
      if max <= 0 || max < element
        max = element
      end
    end

    [max, counter]
    puts "Max = #{max} and the Cost = #{counter}🍔s"
  end
end
# lt = LinearTime.new
# lt.largest_unsorted_item([2,6,3,88,32,9])
# lt.largest_unsorted_item((1..20000000).to_a)
