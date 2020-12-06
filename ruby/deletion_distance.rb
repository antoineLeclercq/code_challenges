def deletion_distance(str1, str2)
  helper(str1, str2, str1.size - 1, str2.size - 1, {})
end

def helper(str1, str2, i1, i2, cache)
  return i1 + 1 if i2 < 0
  return i2 + 1 if i1 < 0

  if str1[i1] == str2[i2]
    cache[[i1 - 1, i2 - 1]] ||= helper(str1, str2, i1 - 1, i2 - 1, cache)
    cache[[i1, i2]] = cache[[i1 - 1, i2 - 1]]
  else
    cache[[i1 - 1, i2]] ||= helper(str1, str2, i1 - 1, i2, cache)
    cache[[i1, i2 - 1]] ||= helper(str1, str2, i1, i2 - 1, cache)
    cache[[i1, i2]] = 1 + [cache[[i1 - 1, i2]], cache[[i1, i2 - 1]]].min
  end

  cache[[i1, i2]]
end
