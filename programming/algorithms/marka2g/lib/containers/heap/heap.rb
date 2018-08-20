require 'pry'
require 'node'

class Containers::Heap
  include Enumerable

  def initialize(array = [], &block)
    @compare_function = block || lambda { |x, y| (x <=> y) == -1 }
    @next = nil
    @size = 0
    @stored = {}

    array.each { |nd| push(nd) } unless array.empty?
  end

  def size
    @size
  end
  alias_method :length, :size

  def push(key, value=key)
    # node = Node.new HERE
  end
  alias_method :<<, :push

  def has_key?(key)
  end

  def next
  end

  def next_key
  end

  def reset
  end

  def empty?
  end

  def merge!(other_heap)
  end

  def pop
  end
  alias_method :next!, :pop

  def change_key
  end

  def delete
  end

end
