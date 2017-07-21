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
def is_valid_bst(root)
    is_valid_bst_helper(root, nil, nil)
end

def is_valid_bst_helper(root, min, max)
    return true if root.nil?

    return false if (min && root.val <= min) || (max && root.val >= max)

    is_valid_bst_helper(root.left, min, root.val) && is_valid_bst_helper(root.right, root.val, max)
end
