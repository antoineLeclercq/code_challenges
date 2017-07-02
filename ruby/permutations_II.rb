# [1,1,2]
# [false, false, false]
# [1, 1, 2]

# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
    result = []
    permute_unique_helper(nums, [], result, Array.new(nums.size, false), {})

    result
end

def permute_unique_helper(nums, solution, result, nums_status, solutions)
    if solution.size == nums.size
        if solutions[solution].nil?
            result << solution.clone
            solutions[solution] = true
        end
    else
        nums.each_with_index do |n, i|
            next if nums_status[i]
            
            solution << n
            nums_status[i] = true
            
            permute_unique_helper(nums, solution, result, nums_status, solutions)
            
            solution.pop
            nums_status[i] = false
        end
    end
end
