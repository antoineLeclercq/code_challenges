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
    return nil if head.nil?

    sub_ll_solved = remove_elements(head.next, val)

    if head.val == val
        sub_ll_solved
    else
        head.next = sub_ll_solved
        head
    end
end
