# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
    result = []
    nums.sort!
    permute_unique_helper(nums, result, [], Array.new(nums.size, false))

    result
end

def permute_unique_helper(nums, result, solution, nums_status)
    if solution.size == nums.size
        result << solution.clone
    else
        nums.each_with_index do |num, i|
            next if nums_status[i] || (i > 0 && !nums_status[i - 1] && nums[i] == nums[i - 1])

            solution << num
            nums_status[i] = true

            permute_unique_helper(nums, result, solution, nums_status)

            solution.pop
            nums_status[i] = false
        end
    end
end
