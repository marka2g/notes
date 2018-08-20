# O(1) Constant Time
class ConstantTime
  def initialize
  end

  def even_or_odd?(number)
    number % 2 ? 'Odd' : 'Even'
    # bitwise also works
    # @number & 1 ? 'Odd' : 'Even'
  end

  # MashMap/ Hash/ LookupTable
  def lookup_table(word)
    words_used = {the: 22038615, be: 12545825, and: 10741073, of: 10343885, a: 10144200, in: 6996437, to: 6332195, blah: 98498984, meh: 99023977}

    words_used[word.to_sym].present? ?
    words_used[word.to_sym] : 0
  end
end
# runit
# ct = ConstantTime.new
# ct.even_or_odd?(3887)
# ct.lookup_table('blah')
