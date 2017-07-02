# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
    result = []
    combination_sum_helper(candidates, target, result, [], {})
    
    result
end

def combination_sum_helper(candidates, target, result, solution, solutions)
    if solution.reduce(:+) == target
        if solutions[solution.sort].nil?
            result << solution.clone
            solutions[solution.sort] = true
        end
    else
        candidates.each do |n|
            next if solution.size > 0 && solution.reduce(:+) + n > target
            
            solution << n
            combination_sum_helper(candidates, target, result, solution, solutions)
            
            solution.pop
        end
    end
end
