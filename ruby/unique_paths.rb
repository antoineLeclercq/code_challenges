# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
    unique_paths_helper(m, n, {})
end

def unique_paths_helper(m, n, cache)
    return 1 if (n == 1 || m == 1)
    
    last_paths_count_from_left = cache[[m, n - 1]] || unique_paths_helper(m, n - 1, cache)
    last_paths_count_from_top = cache[[m - 1, n]] || unique_paths_helper(m - 1, n, cache)
    
    result = last_paths_count_from_left + last_paths_count_from_top
    cache[[m, n]] = result
    result
end
