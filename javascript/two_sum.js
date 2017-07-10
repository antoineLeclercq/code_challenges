/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
    var differenceHash = {};

    for (var i = 0; i < nums.length; i++) {
        var n = nums[i];
        var firstNumberIndex = differenceHash[n];

        if (firstNumberIndex === undefined) {
            differenceHash[target - n] = i;
        } else {
            return [firstNumberIndex, i];
        }
    }
};
