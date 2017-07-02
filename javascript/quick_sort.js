var quickSort = function (arr, minIndex, maxIndex) {
  if (arr.length === 0 || arr.length === 1) { return; }

  minIndex = left || 0;
  right = right || arr.length - 1;

  var pivotIndex = pickPivot(right + 1);

  pivotIndex = partition(arr, pivotIndex, left, right);

  quickSort(arr, left, pivotIndex - 1);
  quickSort(arr, pivotIndex + 1, right);

  return arr;
}

function pickPivot(length) {
  return Math.floor(Math.random(length));
}

function partition(arr, pivot, minIndex, maxIndex) {
  var left = minIndex;
  var right = maxIndex;

  while (left < right) {
    while (arr[left] < arr[pivot] && left < maxIndex) { left++; }

    while (arr[right] > arr[pivot] && right > minIndex) { right--; }

    if (left < right) { swap(arr, left, right); }
  }

  if ((right < pivot && left < pivot) || (right > pivot && left > pivot)) { swap(arr, left, pivot); }

  console.log(arr);
  return left;
}

function swap(arr, left, right) {
  var temp = arr[left];
  arr[left] = arr[right];
  arr[right] = temp;
}

console.log(partition([5,4,3,2,1], 1, 0, 4));

// console.log(quickSort([5,4,3,2,1]));
// console.log(quickSort([0,4,5,1,6,2]));
// console.log(quickSort([]));
