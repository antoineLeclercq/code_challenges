# @param {String} s
# @return {String[][]}
def partition(s)
  result = []

  partition_helper(s, [], result)

  result
end

def partition_helper(s, solution, result)
  if s.empty?
      result << solution.clone
  else
    (0...s.size).each do |i|
      substr = s[0..i]

      next unless palindrome?(substr)
      solution << substr

      partition_helper(s[i + 1..-1], solution, result)

      solution.pop
    end
  end
end

def palindrome?(str)
  return true if str.size == 1

  left = 0
  right = str.size - 1

  while (left < right)
    return false unless str[left] == str[right]
    left += 1
    right -= 1
  end

  true
end
