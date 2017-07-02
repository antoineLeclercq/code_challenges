class MyStack
  def initialize()
    @queue1 = []
    @queue2 = []
  end

  def push(x)
    if @queue1.empty?
      @queue1.push(x)
      transfer_elements_between_queues(@queue2, @queue1)
    else
      @queue2.push(x)
      transfer_elements_between_queues(@queue1, @queue2)
    end
  end

  def pop
    if @queue1.empty?
      @queue2.shift
    else
      @queue1.shift
    end
  end

  def top
    @queue1.first || @queue2.first
  end

  def empty
    @queue1.empty? && @queue2.empty?
  end

  private

  def transfer_elements_between_queues(full_queue, empty_queue)
    return if full_queue.empty?
    empty_queue.push(full_queue.shift) until full_queue.empty?
  end
end
