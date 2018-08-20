# O(n^c) Polynomial Time - TripleNested Loops
# say u need to solve for: 3x + 9y + 8z = 79
class PolynomialTime
  attr_reader :number

  def initialize(input_number)
    @number = input_number
  end

  def find_xyz
    x, y, z = 0, 0, 0
    solutions = []

    for a in (0..@number).to_a
      x = a
      a += 1
      for b in (0..@number).to_a
        y = b
        b += 1
        for c in (1..@number).to_a
          z = c
          c += 1
          if(3*x + 9*y + 8*z === 79)
            solutions.push({x: x, y: y, z: z})
          end
        end
      end
    end
    solutions
  end
end

# pt = PolynomialTime.new(10)
# pt.find_xyz # => [{x: 0, y: 7, z: 2}, ....]
