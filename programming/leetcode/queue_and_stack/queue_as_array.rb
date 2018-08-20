class QueueAsArray
  def initialize(size = 1)
    @length = size
    self.reset
  end

  def enqueue(element)
    raise 'The Queue is Full' if self.full?
    @queue[@tail] = element

    if @head.nil?
      @head = 0
    end

    if @tail == @length - 1
      @tail = 0
    else
      @tail += 1
    end
  end

  def dequeue
    raise 'The Queue is Empty' if self.empty?

    front_element = @queue[@head]

    if @head == @length - 1
      @head = 0
    else
      @head += 1
    end

    if @head == @tail
      self.reset
    end

    return front_element
  end

  def full?
    @head == @tail
  end

  def empty?
    @head.nil?
  end

  def reset
    @queue = Array.new(@length)
    @head, @tail = nil, 0
  end
end

# qa = QueueAsArray.new
# qa.enqueue(5)
# qa.enqueue(3)
