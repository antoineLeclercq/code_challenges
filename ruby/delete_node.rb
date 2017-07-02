# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

def delete_node(node)
  return unless node && node.next

  current = node
  next_node = current.next

  while current && current.next
    current.val = next_node.val

    if next_node.next
      current = current.next
      next_node = next_node.next
    else
      current.next = nil
    end
  end
end
