# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
    left = 0
    right = nums.size - 1

    while left + 1 < right
       mid = left + (right - left) / 2

        if target == nums[mid]
            return mid
        elsif target > nums[mid]
            if nums[mid] < nums[left] && target > nums[right]
                right = mid
            else
                left = mid
            end
        else
            if nums[mid] > nums[right] && target <= nums[right]
                left = mid
            else
                right = mid
            end
        end
    end

    if nums[left] == target
        left
    elsif nums[right] == target
        right
    else
        -1
    end
end
