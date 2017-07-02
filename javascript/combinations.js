/**
 * @param {number} n
 * @param {number} k
 * @return {number[][]}
 */
var combine = function(n, k) {
    var result = [];
    combineHelper(n, k, [], result);
    
    return result;
};

function combineHelper(max, solutionSize, solution, result) {
    if (solution.length === solutionSize) {
        result.push(solution.slice());
    } else {
        var current = solution.length > 0 ? solution[solution.length - 1] : 0
        for (var i = current + 1; i <= max; i++) {
            solution.push(i);
            combineHelper(max, solutionSize, solution, result);
            solution.pop();
        }
    }
}
