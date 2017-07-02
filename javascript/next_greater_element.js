function Stack() {
  this.elems = [];
}

Stack.prototype.push = function (e) {
  return this.elems.push(e);
};

Stack.prototype.pop = function () {
  return this.elems.pop();
};

Stack.prototype.peek = function (e) {
  return this.elems[this.elems.length - 1];
};

Stack.prototype.empty = function (e) {
  return this.elems.length === 0;
};

var nextGreaterElement = function(findNums, nums) {
  var numsWithGreaterElement = {};
  var stackDecreasingElements = new Stack();
  var result = [];

  nums.forEach(function (e) {
    if (stackDecreasingElements.empty() || stackDecreasingElements.peek() > e) {
      stackDecreasingElements.push(e);
    } else {
      while (!stackDecreasingElements.empty() && stackDecreasingElements.peek() < e) {
        numsWithGreaterElement[stackDecreasingElements.pop()] = e;
      }
      stackDecreasingElements.push(e);
    }
  });

  findNums.forEach(function (e) {
    if (numsWithGreaterElement[e]) {
      result.push(numsWithGreaterElement[e]);
    } else {
      result.push(-1);
    }
  });

  return result;
};
