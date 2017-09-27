function deletionDistance(str1, str2) {
  var memo = {};

  return dHelper(str1, str2, str1.length, str2.length, memo);
}

function dHelper(str1, str2, i, j, cache) {
  if (i === 0) { return j; }
  if (j === 0) { return i; }

  var cacheKey;

  if (str1[i - 1] === str2[j - 1]) {
    cacheKey = (i - 1) + ',' + (j - 1);
    cache[cacheKey] = cache[cacheKey] ? cache[cacheKey] : dHelper(str1, str2, i - 1, j - 1, cache);

    return cache[(i - 1) + ',' + (j - 1)];
  } else {
    cacheKey = i + ',' + (j - 1);
    cache[cacheKey] = cache[cacheKey] ? cache[cacheKey] : dHelper(str1, str2, i, j - 1, cache);

    cacheKey = (i - 1) + ',' + j;
    cache[cacheKey] = cache[cacheKey] ? cache[cacheKey] : dHelper(str1, str2, i - 1, j, cache);

    return 1 + Math.min(cache[i + ',' + (j - 1)], cache[(i - 1) + ',' + j]);
  }
}
