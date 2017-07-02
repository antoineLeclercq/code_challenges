// Definition for singly-linked list.
function ListNode(val) {
    this.val = val;
    this.next = null;
}

// Iterative Approach
var reverseList = function(head) {
  if (head === null || head.next === null) { return head; }

  var prev = null;
  var current = head;
  var next = current.next;

  while (current) {
    current.next = prev;

    prev = current;
    current = next;
    if (next) { next = next.next; }
  }

  return prev;
};

// Recursive Approach
var reverseList = function(head) {
  if (head === null || head.next === null) { return head; }

  var reversed_head = reverseList(head.next);
  var tail = getTail(reversed_head);

  tail.next = head;
  head.next = null;

  return reversed_head;
};

function getTail(head) {
  var current = head;
  while (current.next) {
    current = current.next;
  }

  return current;
}
