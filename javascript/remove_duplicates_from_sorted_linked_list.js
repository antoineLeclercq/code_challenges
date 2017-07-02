// Definition for singly-linked list.
function ListNode(val) {
    this.val = val;
    this.next = null;
}

// Iterative Approach
var deleteDuplicates = function(head) {
  if (head === null) { return null; }

  var dummy_head = new ListNode(null);
  var current;

  dummy_head.next = head;
  current = dummy_head;

  while (current && current.next) {
    var next_node = current.next;

    while (next_node !== null && next_node.val === current.val) {
      next_node = next_node.next;
    }

    current.next = next_node;

    current = current.next;
  }

  return dummy_head.next;
};

// Recursive Approach
var deleteDuplicates = function(head) {
  if (head === null || head.next === null) { return head; }

  if (head.val === head.next.val) {
    return deleteDuplicates(head.next);
  } else {
    head.next = deleteDuplicates(head.next);
    return head;
  }
};
