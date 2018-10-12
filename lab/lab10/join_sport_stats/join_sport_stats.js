/*
* Given a list of career stats for a team of rugby players,
* a list of player names, and a list of team names, in the format below:
*
* players
* {
*     "players": [
*         {
*             "id": 112814,
*             "matches": "123",
*             "tries": "11"
*         }
*     ],
*     "team": {
*         "id": 10,
*         "coach": "John Simmons"
*     }
* }
* names
* {
*     "names": [
*         {
*             "id": 112814,
*             "name": "Greg Growden"
*         }
*     ]
* }
* teams
* {
*     "teams": [
*         {
*             "id": 10,
*             "team": "NSW Waratahs"
*         }
*     ]
* }
* Write a program that returns a 'team sheet' that lists
* the team, coach, players in that order in the following list format.
*
* [
*     "Team Name, coached by CoachName",
*     "1. PlayerName",
*     "2. PlayerName"
*     ....
* ]
*
* Where each element is a string, and the order of the players
* is ordered by the most number of matches played to the least number of matches played.
*
* For example, the following input should match the
* following output exactly.
*
* input data
* {
*     "players": [
*         {"id": 1,"matches": "123", "tries": "11"},
*         {"id": 2,"matches": "1",   "tries": "1"},
*         {"id": 3,"matches": "2",   "tries": "5"}
*     ],
*     "team": {
*         "id": 10,
*         "coach": "John Simmons"
*     }
* }
*
* {
*     "names": [
*         {"id": 1, "John Fake"},
*         {"id": 2, "Jimmy Alsofake"},
*         {"id": 3, "Jason Fakest"}
*     ]
* }
*
* {
*     "teams": [
*         {"id": 10, "Greenbay Packers"},
*     ]
* }
*
* output
* [
*     "Greenbay Packers, coached by John Simmons",
*     "1. John Fake",
*     "2. Jason Fakest",
*     "3. Jimmy Alsofake"
* ]
*
* test with
* `node test.js team.json names.json teams.json`
*/
function cmpMatchesFunc(a,b){
	var valA = parseInt(a["matches"]);
	var valB = parseInt(b["matches"]);
	return valB - valA; 
}

function cmpIdFunc(a,b){
	var valA = parseInt(a["id"]);
	var valB = parseInt(b["id"]);
	return valA - valB;
}

function makeTeamList(teamData, namesData, teamsData) {
    	// Take it step by step.
	var teamPlayers = teamData["players"];
	var teamTeam = teamData["team"];
	var names = namesData;
	var teams = teamsData;
	//return [teamTeam]
	var playersNames = teamPlayers.map((players)=> {
		var haveEqualId = (name) => name["id"] === players["id"]
		var playerName = names.find(haveEqualId)
		return Object.assign({}, players, playerName);
	})
	
	var teamTeams = [teamTeam].map((coach)=> {
		var haveEqualId = (team) => team["id"] === coach["id"]
		var teamName = teams.find(haveEqualId)
		return Object.assign({}, coach, teamName)
	})
	var orderedPlayersNames = playersNames.sort(cmpMatchesFunc)
	//return teamTeams;
	//return orderedPlayersNames;
	
	var resultList = [];
	var coachAndTeam = teamTeams[0].team + ", coached by "+ teamTeams[0].coach;
	resultList.push(coachAndTeam);
	var count = 1;
	orderedPlayersNames.forEach(function(element) {
		var playerStr = count + ". "+ element.name;
		resultList.push(playerStr);
		count++;
	});
	return resultList;
}

module.exports = makeTeamList;
