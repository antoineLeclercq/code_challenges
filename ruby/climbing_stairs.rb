# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
    climb_helper(n, {})
end

def climb_helper(n, cache)
    return 1 if (n == 1)
    return 2 if (n == 2)

    climb_ways_count_one_step_from_top = cache[n - 1] || climb_helper(n - 1, cache)
    climb_ways_count_two_steps_from_top = cache[n - 2] || climb_helper(n - 2, cache)

    result = climb_ways_count_one_step_from_top + climb_ways_count_two_steps_from_top
    cache[n] = result

    result
end
