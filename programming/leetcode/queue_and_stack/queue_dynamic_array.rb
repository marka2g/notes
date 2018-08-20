class QueueDynamicArray

  def initialize(size = 1)
    @length = size
    self.reset
  end

  def enqueue
  end

  def dequeue
  end

private

  def reset
    @array = Array.new(@length)
    @head = nil
    @tail = 0
  end
end
