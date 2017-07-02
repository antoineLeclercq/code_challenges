# [10, 9, 2, 5, 3, 7, 101, 18]
#                           ^

# f(i) =   if nums[i] > f(i - 1).last:     f(i - 1).push(nums[i])
#          if nums[i] > f(i - 2).last:     f(i - 2).push(nums[i])
#          if nums[i] > f(i - 3).last:     f(i - 3).push(nums[i])
#          ....
#          if nums[i] > f(0).last:         f(0).push(nums[i])

# f(i) = LONGEST(f(i - k).push(nums[i]) if nums[i] > f(i - k).last)), k: 1..i

# f(i) = COLLECTION_OF_LONGEST_LIS(
#           for each LIS in f(i - k)
#              push(nums[i]) if nums[i] > LIS.last
#        ), k: 1..i

# [10, 9, 2, 5, 3, 7, 101, 18]
#                           ^

# f(i) =   if nums[i] > nums[f(i - 1)[1]]:     [f(i - 1)[0] + 1, i]
#          if nums[i] > nums[f(i - 2)[1]]:     [f(i - 2)[0] + 1, i]
#          if nums[i] > nums[f(i - 3)[1]]:     [f(i - 3)[0] + 1, i]
#          ....
#          if nums[i] > nums[f(1)[1]]:     [f(1)[0] + 1, i]
#          if nums[i] > nums[f(0)[1]]:     [f(0)[0] + 1, i]

# f(i) = MAX(if nums[i] > nums[f(i - k)[1]]: [f(i - k)[0] + 1, i]), k: 1..i


def length_of_lis(nums)
  helper(nums, nums.size - 1).size
end

def helper(nums, end_index, last_index_lis)
  return [] if nums.size == 0
  return [nums[0]] if nums.size == 1 || end_index == 0

  current_lis = []

  (1..end_index).each do |k|
    new_end_index = end_index - k
    previous_lis = helper(nums, new_end_index)

    previous_lis << nums[end_index] if previous_lis.empty? || nums[end_index] > previous_lis.last

    current_lis = previous_lis if previous_lis.size > current_lis.size
  end

  current_lis
end

#######################################

def length_of_lis(nums)
  helper(nums, nums.size - 1).first.size
end

def helper(nums, end_index, last_index_lis)
  return [[]] if nums.size == 0
  return [[nums[0]]] if nums.size == 1 || end_index == 0

  all_lis = nil
  (1..end_index).each do |k|
    new_end_index = end_index - k
    all_previous_lis = helper(nums, new_end_index)

    all_previous_lis.each do |previous_lis|
      previous_lis << nums[end_index] if previous_lis.empty? || nums[end_index] > previous_lis.last
    end

    all_lis = all_previous_lis
  end

  max_size = all_lis.map(&:size).max
  all_lis.select { |lis| lis.size == max_size }
end

#######################################

def length_of_lis(nums)
  helper(nums, nums.size - 1).first.first
end

def helper(nums, end_index)
  return [[0, nil]] if nums.size == 0
  return [[1, 0]] if end_index == 0

  all_lis_lengths_and_last_index = (1..end_index).map do |i|
    new_end_index = end_index - i
    all_max_lis = helper(nums, new_end_index)

    all_max_lis.map! do |prev_max_lis|
        if nums[end_index] > nums[prev_max_lis[1]]
          prev_max_lis[0] += 1
          prev_max_lis[1] = end_index
        end

        prev_max_lis
    end

    all_max_lis
  end.flatten(1).uniq

  max_length = all_lis_lengths_and_last_index.map(&:first).max
  all_lis_lengths_and_last_index.select do |lis|
    lis.first == max_length
  end
end
