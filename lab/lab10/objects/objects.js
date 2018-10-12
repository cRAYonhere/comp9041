/*
 * Fill out the Person prototype
 * function "buyDrink" which given a drink object which looks like:
 * {
 *     name: "beer",
 *     cost: 8.50,
 *     alcohol: true
 * }
 * will add the cost to the person expences if the person
 * is
 *    1. old enough to drink (if the drink is alcohol)
 *    2. buying the drink will not push their tab over $1000
 *
 * in addition write a function "getRecipt" which returns a list as such
 * [
 *    {
 *        name: beer,
 *        count: 3,
 *        cost: 25.50
 *    }
 * ]
 *
 * which summaries all drinks a person bought by name in order
 * of when they were bought (duplicate buys are stacked)
 *
 * run with `node test.js <name> <age> <drinks file>`
 * i.e
 * `node test.js alex 76 drinks.json`
 */

function Person(name, age) {
	this.name = name;
	this.age = age;
   	this.tab = 0;
    	this.history = [];
    	this.historyLen = 0;
    	this.canDrink = function() {
      		return this.age >= 18;
    	};
    	this.canSpend = function(cost) {
      		return this.tab + cost <= 1000;
    	};
	this.addHistory = function(itemName,itemCost){
		var newItem = { name:itemName, count:1, total: itemCost };
		this.history.push(newItem);
	}

}

// write me
Person.prototype.buyDrink = function(drink) {
	if ( ( this.canDrink() || drink.alcohol == false ) && this.canSpend(drink.cost) ) {	
		this.tab += drink.cost;
		var foundFlag = false;
		this.history.forEach(function(element){
			// console.log(drink.name+ " "+ element.name);
			if(drink.name == element.name) {
				element.count++;
				element.total += drink.cost;
				foundFlag = true;
			}
			//this.addHitory(drink.name, drink.cost);	
		});
		if(!foundFlag){
			this.addHistory(drink.name, drink.cost);
		}
	}
}
// write me
Person.prototype.getRecipt = function() {
	return this.history;
}

module.exports = Person;
