# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    result = []
    permute_helper(nums, [], result)
    
    result
end

def permute_helper(nums, solution, result)
    if (solution.size == nums.size)
        result << solution.clone
    else
        nums.each do |n|
            next if solution.include? n
            solution << n
            permute_helper(nums, solution, result)
            solution.pop
        end
    end
end
