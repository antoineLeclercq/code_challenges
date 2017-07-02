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

function checkHeight(root) {
  if (root === null) { return 0; }

  var leftHeight = checkHeight(root.left);
  var rightHeight = checkHeight(root.right);
  var heightDiff = leftHeight - rightHeight;

  if (Math.abs(heightDiff) > 1) {
    return -Infinity;
  } else {
    return Math.max(leftHeight, rightHeight) + 1;
  }
}

var isBalanced = function(root) {
  return checkHeight(root) !== -Infinity;
};

// Other solution using booleans instead of `Infinity`
var isBalanced = function(root) {
    if (root === null) { return true; }
        
    return heitghtAndBalancedBT(root)[1];
};

function heitghtAndBalancedBT(root) {
    if (root === null) { return [0, true]; }

    var leftResult = heitghtAndBalancedBT(root.left);
    var leftHeight = leftResult[0];
    
    var rightResult = heitghtAndBalancedBT(root.right);
    var rightHeight = rightResult[0];
    
    var resultState = leftResult[1] && rightResult[1];
    var heightDiff = Math.abs(leftHeight - rightHeight);
    
    if (heightDiff <= 1) {
        return [Math.max(leftHeight, rightHeight) + 1, resultState];
    } else {
        return [Math.max(leftHeight, rightHeight) + 1, false];
    }
}
