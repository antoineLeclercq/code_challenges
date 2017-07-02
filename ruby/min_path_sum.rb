# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
    row = grid.size - 1
    col = grid[0].size - 1
    cache = {}
    
    fill_cache_with_base_case_values(grid, cache)
    
    min_path_sum_helper(grid, row, col, cache)
end

def min_path_sum_helper(grid, row, col, cache)
    return cache[[row, col]] if row < 1
    return cache[[row, col]] if col < 1
    
    left_sum = cache[[row - 1, col]] || min_path_sum_helper(grid, row - 1, col, cache)
    right_sum = cache[[row, col - 1]] || min_path_sum_helper(grid, row, col - 1, cache)
    
    current = grid[row][col]
    result = [left_sum, right_sum].min + current
    cache[[row, col]] = result

    result
end

def fill_cache_with_base_case_values(grid, cache)
    grid[0].each_with_index do |num, col|
        if col == 0
            cache[[0, col]] = num
        else
            cache[[0, col]] = cache[[0, col - 1]] + num
        end
    end
    
    grid.each_with_index do |nums, row|
        if row == 0
            cache[[row, 0]] = nums[0]
        else
            cache[[row, 0]] = cache[[row - 1, 0]] + nums[0]
        end
    end
end
