def find_min(nums)
  left = 0
  right = nums.size - 1

  while left + 1 < right
    mid = left + (right - left) / 2
    curr = nums[mid]
    
    if curr > nums[right]
      left = mid
    else
      right = mid
    end
  end

  if nums[left] < nums[right]
    nums[left]
  else
    nums[right]
  end
end
