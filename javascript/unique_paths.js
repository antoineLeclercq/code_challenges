/**
 * @param {number} m
 * @param {number} n
 * @return {number}
 */
var uniquePaths = function(m, n) {
    return dp(m, n, {});
};

function dp(m, n, cache) {
    if (m === 0 || n === 0) { return 0; }
    if (m === 1 || n === 1) { return 1; }

    var cacheKeym = (m - 1) + ',' + n;
    var cacheKeyn = m + ',' + (n - 1);

    cache[cacheKeym] = cache[cacheKeym] || dp(m - 1, n, cache);
    cache[cacheKeyn] = cache[cacheKeyn] || dp(m, n - 1, cache);

    return cache[cacheKeym] + cache[cacheKeyn];
}
