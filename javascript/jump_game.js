/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
    return dp(nums, nums.length, { 1: true });
};

function dp(nums, numsLength, cache) {
    if (numsLength <= 1) { return true; }

    for (var i = 0; i < numsLength - 1; i++) {
        var k = numsLength - (i + 1);

        cache[numsLength - k] = cache[numsLength - k] !== undefined ? cache[numsLength - k] : dp(nums, numsLength - k, cache);

        result = cache[numsLength - k] && nums[numsLength - 1 - k] >= k;

        if (result) { return true; }
    }

    return false;
}
