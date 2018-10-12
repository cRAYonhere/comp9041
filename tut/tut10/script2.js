// this can be confusing
const o = {
   bb: 0,
   f() {
      console.log(this.bb);
   }
};

// What does this print out
o.f();
console.log("Prediction: 0")
console.log("<===========================>")
// What does this line do
let a = o.f;

// What would this print out
a();
console.log("Prediction: undefiend")
console.log("<===========================>")

const oo = {bb: 'Barry'};

// What does call do and what will it print out?
a.call(oo);
console.log("Prediction: Barry")
console.log("<===========================>")
// What does bind do, is f() the same as a()?
const f = a.bind(oo);

// what does this print out
f();
console.log("Prediction: Barry")
