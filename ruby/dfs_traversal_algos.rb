class Node
  attr_accessor :right, :left
  attr_reader :val

  def initialize(val)
    @left = nil
    @right = nil
    @val = val
  end
end

# recursive
def preorder_traversal_rec(root)
  if root
    puts root.val
    preorder_traversal_rec(root.left)
    preorder_traversal_rec(root.right)
  end
end

def inorder_traversal_rec(root)
  if root
    inorder_traversal_rec(root.left)
    puts root.val
    inorder_traversal_rec(root.right)
  end
end

def postorder_traversal_rec(root)
  if root
    postorder_traversal_rec(root.left)
    postorder_traversal_rec(root.right)
    puts root.val
  end
end

# iterative
def preorder_traversal_it(root)
  stack = []
  current = root

  until current.nil? && stack.empty?
    puts current.val
    stack.push(current.right) if current.right
    current = current.left || stack.pop
  end
end

def inorder_traversal_it(root)
  stack = []
  current = root

  until current.nil? && stack.empty?
    if current
      stack.push(current)
      current = current.left
    else
      unless stack.empty?
        current = stack.pop
        puts current.val
        current = current.right
      end
    end
  end
end

def postorder_traversal_it(root)
end

root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)
root.right.left = Node.new(6)
root.right.right = Node.new(7)

puts "Preorder traversal of binary tree is"
preorder_traversal_rec(root)
puts
preorder_traversal_it(root)

puts "\nInorder traversal of binary tree is"
inorder_traversal_rec(root)
puts
inorder_traversal_it(root)

puts "\nPostorder traversal of binary tree is"
postorder_traversal_rec(root)
puts
postorder_traversal_it(root)