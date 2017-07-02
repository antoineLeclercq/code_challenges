# nums = [2,3,1,1,4]

# f(n)   =     if nums[n-1] >= 1: f(n-1) + 1
#              if nums[n-2] >= 2: f(n-2) + 1
#              if nums[n-3] >= 3: f(n-3) + 1
#              ...
#              if nums[1] >= n - 2: f(0) + 1
#              if nums[0] >= n - 1: 1

# f(n) = MIN(if nums[n-k] >= k: f(n-k) + 1), for k: 0..n-1

# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  jump_helper(nums, nums.size - 1, {})
end

def jump_helper(nums, end_index, cache)
  return 0 if nums.size <= 1
  return 0 if end_index == 0

  current_min = Float::INFINITY

  (1..end_index).each do |i|
    end_index_from_i = end_index - i

    if nums[end_index_from_i] >= i
      current_min = [current_min, (cache[end_index_from_i] || jump_helper(nums, end_index_from_i, cache)) + 1].min
      cache[end_index] = current_min
    end
  end

  current_min
end

