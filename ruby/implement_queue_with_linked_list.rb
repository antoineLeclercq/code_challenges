class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

class Queue
  attr_accessor :head, :tail

  def enqueue(val)
    if head
      tail.next = Node.new(val)
      self.tail = tail.next
    else
      self.head = Node.new(val)
      self.tail = head
    end

    val
  end

  def dequeue
    if head
      dequeued_node = head
      self.head = head.next
      dequeued_node.val
    end
  end
end

class Stack
  attr_accessor :head

  def push(val)
    new_node = Node.new(val)
    new_node.next = head
    self.head = new_node
    val
  end

  def pop
    if head
      popped_node = head
      self.head = head.next
      popped_node.val
    end
  end

  def peek
    head.val
  end
end

queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

p queue.dequeue
p queue.dequeue
p queue.dequeue

puts

stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
p stack.pop
p stack.pop
p stack.pop