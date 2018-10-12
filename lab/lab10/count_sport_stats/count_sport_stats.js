/*
  Given a list of games, which are objects that look like:

  {
    "id": 112814,
    "matches": "123",
    "tries": "11"
  }

  return a object like such

  {
    "totalMatches": m,
    "totalTries": y
  }

  Where m is the sum of all matches for all games
  and t is the sum of all tries for all games.

  input = [
    {"id": 1,"matches": "123","tries": "11"},
    {"id": 2,"matches": "1","tries": "1"},
    {"id": 3,"matches": "2","tries": "5"}
  ]

  output = {
    matches: 126,
    tries: 17
  }

  test with `node test.js stats.json`
  or `node test.js stats_2.json`
*/

var reduceMatches = (deets) => { return parseInt(deets.matches) };
var reduceTries = (deets) => { return parseInt(deets.tries) };
var sumArray = (total, current) => total + current;

function countStats(list) {
  // HINT: maybe REDUCE the problem ;)
	var matchesArr = list.map(reduceMatches);
	var triesArr = list.map(reduceTries);
	var matches = matchesArr.reduce(sumArray, 0); 
	var tries = triesArr.reduce(sumArray, 0);

	return {"matches":matches, "tries":tries}
}

module.exports = countStats;
