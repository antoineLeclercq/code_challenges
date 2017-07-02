# T: O(n), S: O(1), sorted array
def two_sum(nums, target)
  left = 0
  right = nums.length - 1

  while left < right
    sum = nums[left] + nums[right]
    return [left + 1, right + 1] if sum == target

    left += 1 if (sum < target)
    right -= 1 if (sum > target)
  end
end
