# Design and implement a TwoSum class. It should support the following operations: add
# and find.
# add(input) – Add the number input to an internal data structure.
# find(value) – Find if there exists any pair of numbers which sum is equal to the value.
# For example,
# add(1); add(3); add(5); find(4) => true; find(7) => false

class TwoSum
  def initialize
    @storage = {}
  end

  def add(n)
    if @storage[n]
      @storage[n] += 1
    else
      @storage[n] = 1
    end
  end

  def find(target)
    @storage.keys.each do |n, count|
      diff = target - n

      if diff == n
        return true if @storage[diff] >= 2
      elsif @storage[diff]
        return true
      end
    end

    false
  end
end

t = TwoSum.new
t.add(1)
t.add(3)
t.add(5)
p t.find(4)
p t.find(7)
