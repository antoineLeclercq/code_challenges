function UndirectedGraphNode(label) {
    this.label = label;
    this.neighbors = [];   // Array of UndirectedGraphNode
}

/**
 * @param {UndirectedGraphNode} graph
 * @return {UndirectedGraphNode}
 */
var cloneGraph = function(graph) {
    var visited = {};

    return cloneGraphHelper(graph, visited);
};

function cloneGraphHelper(graph, visited) {
    if (graph === null) return null;
    if (visited[graph.label]) return visited[graph.label];

    var clone = new UndirectedGraphNode(graph.label);

    visited[graph.label] = clone;

    graph.neighbors.forEach(function (node) {
        clone.neighbors.push(cloneGraphHelper(node), visited);
    });

    return clone;
}
