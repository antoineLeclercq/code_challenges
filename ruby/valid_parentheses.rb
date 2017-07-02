# Linked List Node implementation
class Node
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# Stack Implementation
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
    head.val if head
  end

  def empty?
    head.nil?
  end
end

PARENTHESES = { '(' => ')', '{' => '}', '[' => ']' }

def is_valid(s)
  stack = Stack.new
  parentheses_only = s.gsub(/[^\(\)\[\]\{\}]/, '')
  return false if parentheses_only.size <= 1

  parentheses_only.chars.each do |paren|
    if PARENTHESES[paren]
      stack.push(paren)
    else
      return false if paren != PARENTHESES[stack.pop]
    end
  end

  stack.empty?
end
