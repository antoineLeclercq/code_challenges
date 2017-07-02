# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2, carry=0)
    if l1.nil? && l2.nil?
        return ListNode.new(carry) if carry > 0
        return nil
    end

    sum = (l1 ? l1.val : 0) + (l2 ? l2.val : 0) + carry
    
    head = ListNode.new(sum % 10)
    sub_result = add_two_numbers(l1 ? l1.next : l1, l2 ? l2.next : l2, sum / 10)
    head.next = sub_result

    head
end
