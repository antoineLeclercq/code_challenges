/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {boolean}
 */
var isBalanced = function(root) {
    return dc(root, 1).balanced;
};

function dc(root, depth) {
    if (root === null) {
        return {
            balanced: true,
            height: depth - 1,
        };
    }

    var left = dc(root.left, depth + 1);
    var right = dc(root.right, depth + 1);

    return {
        balanced: Math.abs(left.height - right.height) <= 1 && left.balanced && right.balanced,
        height: Math.max(left.height, right.height),
    };
}
