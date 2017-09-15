/**
 * params: str1 String, str2 String
 * output: Boolean
 */
function checkPermutation(str1, str2) {
  if (str1.length !== str2.length) { return false; }

  var charsCount = [];
  for (var i = 0; i < 128; i++) {
    charsCount[i] = 0;
  }

  for (i = 0; i < str1.length; i++) {
    charsCount[str1.charCodeAt(i)]++;
  }

  for (i = 0; i < str2.length; i++) {
    charsCount[str2.charCodeAt(i)]--;
    if (charsCount[str2.charCodeAt(i)] < 0) { return false; }
  }

  return true;
}
