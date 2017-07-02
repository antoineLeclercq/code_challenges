def flatten(root)
  return nil if root.nil?

  left = root.left
  right = root.right

  flatten(root.left)
  flatten(root.right)

  root.left = nil
  root.right = left

  current = root
  current = current.right while current.right
  current.right = right
end
