# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
    can_jump_helper(nums, {})
end

def can_jump_helper(nums, cache)
    return true if nums.size <= 1

    result = (1...nums.size).any? do |i|
        new_last_index = (nums.size - 1) - i

        subset = nums[0..new_last_index]

        cache[subset] || (nums[new_last_index] >= i && can_jump_helper(subset, cache))
    end

    cache[nums] = result
    result
end
