/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var searchRange = function(nums, target) {
    return [findLowerBoundRange(nums, target), findUpperBoundRange(nums, target)]
};

function findLowerBoundRange(nums, target) {
    var left = 0;
    var right = nums.length - 1;
    var mid;
    
    while (left + 1 < right) {
        mid = Math.floor(left + (right - left) / 2);
        current = nums[mid];
        
        if (current === target || current > target) {
            right = mid;
        } else {
            left = mid;
        }
    }
    
    if (nums[left] === target) {
        return left;
    } else if (nums[right] === target) {
        return right;
    } else {
        return -1;
    }
}


function findUpperBoundRange(nums, target) {
    var left = 0;
    var right = nums.length - 1;
    var mid;
    
    while (left + 1 < right) {
        mid = Math.floor(left + (right - left) / 2);
        current = nums[mid];
        
        if (current === target || current < target) {
            left = mid;
        } else {
            right = mid;
        }
    }
    
    if (nums[right] === target) {
        return right;
    } else if (nums[left] === target) {
        return left;
    } else {
        return -1;
    }
}
