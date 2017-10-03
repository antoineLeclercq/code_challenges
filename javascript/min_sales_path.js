function getCheapestCost(rootNode) {
    return dfs(rootNode, rootNode.cost);
}

function dfs(root, currentCumulatedCost) {
  if (root.children.length === 0) {
    return root.cost;
  }

  var costs = [];
  for (var i = 0; i < root.children.length; i++) {
    var child = root.children[i];
    costs.push(dfs(child, currentCumulatedCost + child.cost));
  }

  return Math.min(costs) + root.cost;
}

/******************************************
 * Use the helper code below to implement *
 * and test your function above           *
 ******************************************/

// Constructor to create a new Node
function Node(cost) {
  this.cost = cost;
  this.children = [];
}
