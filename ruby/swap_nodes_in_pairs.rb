def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  second = head.next
  head.next = swap_pairs(second.next)
  second.next = head

  second
end
