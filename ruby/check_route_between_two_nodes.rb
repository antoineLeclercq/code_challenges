def check_route_between_nodes(node1, node2)
  queue = [node1]
  visited = {}

  return true if node1 == node2

  until queue.empty?
    current = queue.shift

    found = current.neighbors.any? do |neighbor|
      queue << neighbor unless visited[neighbor]
      visited[neighbor] = true
      neighbor == node2
    end

    return true if found
  end

  false
end
