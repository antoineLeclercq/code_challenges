# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def largest_values(root)
  return [] if root.nil?

  result = [root.val]

  current_queue = [root]
  holder_queue = []

  until current_queue.empty?
    current = current_queue.shift

    if current
      holder_queue << current.left if current.left
      holder_queue << current.right if current.right
    end

    next unless current_queue.empty?

    max_value_level = holder_queue.map(&:val).max
    result << max_value_level if max_value_level

    temp = current_queue
    current_queue = holder_queue
    holder_queue = temp
  end

  result
end
