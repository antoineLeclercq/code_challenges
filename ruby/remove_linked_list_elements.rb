# Definition for singly-linked list.

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# Iterative Approach
def remove_elements(head, val)
  return nil unless head

  dummy_head = ListNode.new(nil)
  dummy_head.next = head
  current = dummy_head

  while current && current.next
    next_node = current.next
    next_node = next_node.next while next_node && next_node.val == val

    current.next = next_node

    current = current.next
  end

  dummy_head.next
end

# Recursive Approach
def remove_elements(head, val)
  return nil unless head

  if head.next.nil?
    return nil if head.val == val
    return head
  end

  if head.val == val
    remove_elements(head.next, val)
  else
    head.next = remove_elements(head.next, val)
    head
  end
end
