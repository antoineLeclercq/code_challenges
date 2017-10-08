def find_pairs_with_given_difference(arr, k)
  arr.sort!

  pairs = []
  i = 0
  j = 0

  while i < arr.size && j < arr.size
    diff = arr[j] - arr[i]

    if diff > k
      i += 1
    elsif diff < k
      j += 1
    else
      pairs << [arr[j], arr[i]]
      i += 1
      j += 1
    end
  end

  pairs
end
