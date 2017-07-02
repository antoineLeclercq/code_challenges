class MinStack
  def initialize
    @stack = []
  end

  def push(x)
    @min = x if @min.nil? || x < @min
    @stack.push([x, @min])
  end

  def pop
    @stack.pop
    if @stack.empty?
      @min = nil
    else
      @min = get_min
    end
  end

  def top
    @stack.last[0]
  end

  def get_min
    @stack.last[1] if @stack.last
  end
end
