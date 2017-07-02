def subsets(nums)
    result = []
    
    nums.sort!
    (0..nums.size).each { |height| subsets_helper(nums, result, [], height) }
    
    result
end

def subsets_helper(nums, result, solution, height)
    if solution.size == height
        result << solution.clone
    else
        nums.each do |n|
            next if solution.size > 0 && n <= solution.last 
            
            solution << n
            subsets_helper(nums, result, solution, height)
            
            solution.pop
        end
    end
end
