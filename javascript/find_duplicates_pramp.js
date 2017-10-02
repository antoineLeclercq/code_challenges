// Case 1: M ~= N
// arr1 and arr2 are sorted
function findDuplicates(arr1, arr2) {
  var i = 0;
  var j = 0;
  var duplicates = [];

  while (i < arr1.length && j < arr2.length) {
    if (arr1[i] < arr2[j]) {
      i++;
    } else if (arr1[i] > arr2[j]) {
      j++;
    } else {
      duplicates.add(arr1[i]);
      i++;
      j++;
    }
  }

  return duplicates;
}

// Case 2: M >> N (arr2 much bigger than arr1)
function findDuplicates(arr1, arr2) {
  var duplicates = [];

  for (var i = 0; i < arr1.length; i++) {
    var result = binarySearch(arr2, arr1[i]);

    if (result) {
      duplicates.push(result);
    }
  }

  return duplicates;
}

function binarySearch(arr, target) {
  var left = 0;
  var right = arr.length - 1;

  while (left + 1 < right) {
    var mid = left + Math.floor((right - left) / 2);

    if (arr[mid] === target) {
      return target;
    } else if (arr[mid] < target) {
      left = mid;
    } else {
      right = mid;
    }
  }

  if (arr[left] === target || arr[right] === target) {
    return target;
  }

  return false;
}
