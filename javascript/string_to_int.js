/**
 * @param {string} str
 * @return {number}
 */
var myAtoi = function(str) {
    var stringToInt = {
        '0': 0,
        '1': 1,
        '2': 2,
        '3': 3,
        '4': 4,
        '5': 5,
        '6': 6,
        '7': 7,
        '8': 8,
        '9': 9,
    };
    var result = 0;
    var numberString = str.match(/^ *([-+]?\d+).*$/);
    var negative;

    if (numberString === null) { return 0; }

    numberString = numberString[1];
    negative = numberString[0] === '-'

    for (var i = 0; i < numberString.length; i++) {
        var currentExponent = (numberString.length - 1) - i;
        var digit = stringToInt[numberString[i]];

        if (i === 0 && (negative || numberString[0] === '+')) {
            continue;
        }

        result += Math.pow(10, currentExponent) * stringToInt[digit];
    }

    if (negative) { result *= -1 }
    if (result > 2147483647) { return 2147483647; }
    if (result < -2147483648) { return -2147483648; }

    return result;
};
