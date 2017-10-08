[2, 8, 4, ..., 1, 17, 29] n + 1 length
each num between 1 and n

[2, 6, 4, 7, 1, 3, 7, 2], size = 8, 1..7, n = 7
[2, 2, 4, 7, 1, 3, 7, 6]
[2, 2, 4, 7, 1, 6, 7, 3]
[2, 2, 3, 7, 1, 6, 7, 4]
[2, 2, 3, 4, 1, 6, 7, 7]

def find_duplicate(arr)
  space_holder_index = arr.length - 1

  loop do
    i = arr[space_holder_index] - 1

    return arr[i] if arr[i] == arr[space_holder_index]

    temp = arr[space_holder_index]
    arr[space_holder_index] = arr[i]
    arr[i] = temp
  end
end
