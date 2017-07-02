function selectionSort(arr) {
  for (var write = 0; write < arr.length; write++) {
    var minIndex = write;

    for (var read = write + 1; read < arr.length; read++) {
      if (arr[read] < arr[minIndex]) {
        minIndex = read;
      }
    }

    if (write < minIndex) {
      var temp = arr[write];
      arr[write] = arr[minIndex];
      arr[minIndex] = temp;
    }
  }

  return arr;
}

selectionSort([5,4,3,2,1]);
selectionSort([0,4,5,1,6,2]);
selectionSort([]);
