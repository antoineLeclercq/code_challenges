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
def right_side_view(root)
  result = []
  dfs(root, 0, result)
  result
end

def dfs(root, level, result)
  return if root.nil?

  result << root.val if result.size == level

  dfs(root.right, level + 1, result)
  dfs(root.left, level + 1, result)
end
