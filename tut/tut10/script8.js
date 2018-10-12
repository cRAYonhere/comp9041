

var retCost = (cart) => {return cart.cost};
var addCost = (total, current) => total + current;

function totalCostCalc(cart){
   var costArray = cart.map(retCost);
   // console.log(costArray);
   var totalCost = costArray.reduce(addCost);
   // console.log(totalCost);
   return totalCost;
}
const cart = [
  {
    name: 'Apple',
    cost: 2.30
  },
  {
    name: 'Orange',
    cost: 4.50
  },
  {
    name: 'Apple',
    cost: 2.30
  },
  {
    name: 'Strawberry',
    cost: 6.70
  },
  {
    name: 'Orange',
    cost: 4.50
  }
];


var totalCost = totalCostCalc(cart);
console.log(totalCost);
