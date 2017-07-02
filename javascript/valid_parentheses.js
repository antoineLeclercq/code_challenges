/**
 * @param {string} s
 * @return {boolean}
 */
var PARENTHESES = {
    '(': ')',
    '{': '}',
    '[': ']'
};

var isValid = function(s) {
    var stack = []
    var current_paren;
    
    for (var i = 0; i < s.length; i++) {
        current_paren = s[i];
        
        if (PARENTHESES[current_paren]) {
            stack.push(current_paren);
        } else if (current_paren !== PARENTHESES[stack.pop()]) {
            return false;
        }
    }
    
    return stack.length === 0;
};
