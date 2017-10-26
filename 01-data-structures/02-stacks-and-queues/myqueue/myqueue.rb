class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @tail = @queue.last
    @head = @queue.first
  end

  def dequeue
    @queue.delete(@queue[0])
    @head = @queue.first
  end

  def empty?
    @queue.length == 0 ? true : false
  end
end
