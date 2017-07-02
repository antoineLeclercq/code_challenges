def max_depth(node)
  return 0 if node.nil?
  
  new_left_depth = max_depth(node.left) + 1
  new_right_depth = max_depth(node.right) + 1

 if new_left_depth > new_right_depth
    new_left_depth
  else
    new_right_depth
  end
end
