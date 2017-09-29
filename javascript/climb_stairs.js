/**
 * @param {number} n
 * @return {number}
 */
var climbStairs = function(n) {
    return climbStairsHelper(n, { 0: 0, 1: 1, 2: 2 });
};

function climbStairsHelper(n, cache) {
    if (n <= 2) { return cache[n]; }

    cache[n - 1] = cache[n - 1] || climbStairsHelper(n - 1, cache);
    cache[n - 2] = cache[n - 2] || climbStairsHelper(n - 2, cache);

    return cache[n - 1] + cache[n - 2];
}
