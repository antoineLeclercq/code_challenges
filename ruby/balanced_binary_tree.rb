# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  is_balanced_helper(root).last
end

def is_balanced_helper(root)
  return [0, true] if root.nil?

  max_depth_left, balanced_left = is_balanced_helper(root.left)
  max_depth_right, balanced_right = is_balanced_helper(root.right)

  [[max_depth_left, max_depth_right].max + 1, (max_depth_left - max_depth_right).abs <= 1 && balanced_left && balanced_right]
end
