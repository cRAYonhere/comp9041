// let's note the power with cleaning some user data.
const users = [
    {
      name: 'Jeff',
      age: 52,
      gender: 'male'
    },
    {
      name: 'Andy',
      age: 25,
      gender: 'male'
    },
    {
      name: 'Sarah',
      age: 30,
      gender: 'female'
    },
    {
      name: 'Phoebe',
      age: 21,
      gender: 'female'
    },
    {
      name: 'Doris',
      age: 81,
      gender: 'female'
   },
   {
     name: 'Annie',
     age: 75,
     gender: 'female'
  },
  {
   name: 'Anky',
   age: 100,
   gender: 'male'
 }
];

const isMale = (person) => { return person.gender === 'male' };
const returnAge = (person) => {return person.age}
const startsWith = (letter) => (person) => person.name.startsWith(letter);
const sum = (total, current) => total + current;

console.log(users);

const male = users.filter(isMale);
console.log(male);

const maleNameStartingWithA = male.filter(startsWith('A'))
console.log(maleNameStartingWithA);

const ageOfMaleNameStartingWithA = maleNameStartingWithA.map(returnAge);
console.log(ageOfMaleNameStartingWithA);

const avgAgeOfMaleNameStartingWithA = ageOfMaleNameStartingWithA.reduce(sum, 0)/ageOfMaleNameStartingWithA.length;
console.log(avgAgeOfMaleNameStartingWithA);
