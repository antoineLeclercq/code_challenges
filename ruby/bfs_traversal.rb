class Node
  attr_accessor :right, :left
  attr_reader :val

  def initialize(val)
    @left = nil
    @right = nil
    @val = val
  end
end

def level_order_traversal(root)
  queue = []
  current = root

  until current.nil? && queue.empty?
    queue.push current.left if current.left
    queue.push current.right if current.right

    puts current.val

    current = queue.shift
  end
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)

level_order_traversal(root)