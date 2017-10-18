def two_sum(nums, target)
    nums_hash = {}
    nums.each_with_index do |num, i|
        first_num_index = nums_hash[target - num]

        return [first_num_index, i] if first_num_index

        nums_hash[num] = i
    end
end
