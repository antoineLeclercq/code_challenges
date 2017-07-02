def insertion_sort(arr)
  curr_index = 1

  while curr_index < arr.length
    temp = arr[curr_index]
    insertion_index = curr_index

    while insertion_index > 0 && arr[insertion_index - 1] > temp
      insertion_index -= 1
      arr[insertion_index + 1] = arr[insertion_index]
    end

    arr[insertion_index] = temp

    curr_index += 1
  end

  arr
end

p insertion_sort([5,4,3,2,1])
p insertion_sort([0,4,5,1,6,2])
p insertion_sort([])
