# Write a function to find the 2nd largest element in a binary search tree.

class BinaryTreeNode
  attr_accessor :value
  attr_reader :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert_left(value)
    @left = BinaryTreeNode.new(value)
    return @left
  end

  def insert_right(value)
    @right = BinaryTreeNode.new(value)
    return @right
  end
end

def find_second_largest(root)
  return nil if root.nil? || (root.left.nil? && root.right.nil?)

  if root.right
    max = find_largest_element(root.right)

    if max.left
      find_largest_element(max.left)
    else
      max.parent
    end
  else
    find_largest_element(root.left)
  end
end

def find_largest_element(root)
  current = root
  current = current.right while current.right

  current
end
