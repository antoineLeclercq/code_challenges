function wordCountEngine(document) {
  var words = document.match(/\w[a-z']*\w?/gi);
  var wordsAndCount = getWordsCount(words);

  return bucketSort(wordsAndCount);
}

function getWordsCount(words) {
  var wordsAndCount = {};

  for (var i = 0; i < words.length; i++) {
    var word = words[i].replace(/'/, "").toLowerCase();

    if (wordsAndCount[word] === undefined) {
      wordsAndCount[word] = 1;
    } else {
      wordsAndCount[word]++;
    }
  }

  return wordsAndCount;
}

function bucketSort(wordsAndCount) {
  var buckets = [];
  var wordsAndCountSorted = [];

  Object.keys(wordsAndCount).forEach(function(word) {
    var count = wordsAndCount[word];

    if (buckets[count - 1] === undefined) {
      buckets[count - 1] = [[word], count.toString()];
    } else {
      buckets[count - 1][0].push(word);
    }
  });

  for (var i = buckets.length - 1; i >= 0;  i--) {
    if (buckets[i] !== undefined) {
      var words = buckets[i][0];
      var count = buckets[i][1];

      for (var j = 0; j < words.length; j++) {
        wordsAndCountSorted.push([words[j], count]);
      }
    }
  }

  return wordsAndCountSorted;
}
