# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
    result = []
    combine_helper(n, k, [], result)
    
    result
end

def combine_helper(max, solution_size, solution, result)
    if solution.size == solution_size
        result << solution.clone
    else
        current = solution.last || 0
        (current + 1..max).each do |num|
            solution << num
            combine_helper(max, solution_size, solution, result)
            solution.pop
        end
    end
end
