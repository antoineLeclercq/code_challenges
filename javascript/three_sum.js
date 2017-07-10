/**
 * @param {number[]} nums
 * @return {number[][]}
 */
var threeSum = function(nums) {
    nums.sort(function (curr, next) {
        return curr - next;
    });

    var result = [];

    for (var i = 0; i < nums.length - 2; i++) {
        var left = i + 1;
        var right = nums.length - 1;
        var sum;

        while (left < right) {
            sum = nums[i] + nums[left] + nums[right];

            if (sum === 0) {
                result.push([nums[i], nums[left], nums[right]]);

                while (nums[left] === nums[left + 1] && left < right) { left++; }
                while (nums[right] === nums[right - 1] && left < right) { right--; }

                left++;
                right--;
            } else if (sum < 0) {
                left++;
            } else {
                right--;
            }
        }

        while (nums[i] === nums[i + 1] && i < nums.length - 2) { i++; }
    }

    return result;
};
