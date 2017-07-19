# @param {Integer[]} nums
# @return {Integer}
def maximum_product(nums)
  nums.sort!
  return nums[0] * nums[1] * nums[2] if nums.size == 3

  last_index = nums.size - 1

  return nums[last_index] * nums[last_index - 1] * nums[last_index - 2] if nums.last < 0

  first_two_product = nums[0] * nums[1]
  before_two_last_product = nums[last_index - 1] * nums[last_index - 2]

  if first_two_product >= before_two_last_product
    nums.last * first_two_product
  else
    nums.last * before_two_last_product
  end
end
