/**
 * @param {number[]} nums
 * @return {number}
 */
var jump = function(nums) {
    return jumpHelper(nums, nums.length, { 0: 0, 1: 0 });
};

function jumpHelper(nums, length, cache) {
    if (length === 0 || length === 1) {
        return 0;
    }

    var k;
    var minJumpCount = +Infinity;

    for (var i = 0; i < length - 1; i++) {
        k = length - (i + 1);

        if (nums[i] >= k) {
            cache[length - k] = cache[length - k] !== undefined ? cache[length - k] : jumpHelper(nums, length - k, cache);

            if (cache[length - k] < minJumpCount) {
                minJumpCount = cache[length - k];
            }
        }
    }

    return 1 + minJumpCount;
}
