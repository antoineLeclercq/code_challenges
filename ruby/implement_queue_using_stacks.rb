class MyQueue
  def initialize
    @in_stack = []
    @out_stack = []
  end

  def push(x)
    @in_stack.push(x)
  end

  def pop
    if @out_stack.empty?
      @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end

    @out_stack.pop
  end

  def peek
    @out_stack.last || @in_stack.first
  end

  def empty
    @in_stack.empty? && @out_stack.empty?
  end
end
