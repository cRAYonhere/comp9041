function extractTime(s) {
  let re = /(\d+)\s*([ms])/;
  result = re.exec(s);
  // let [num,unit] = result;
  try {
     let num = result[1];
     let unit = result[2];
     //console.log(result)
     if (unit === "m") num *= 60;
     return num;
 }
 catch(e) {
    return "undefined";
 }

}

console.log(extractTime("set timer for 5 minutes"), 300);
console.log(extractTime("set a timer for 10m"), 600);
console.log(extractTime("timer 8minutes"), 480);
console.log(extractTime("new timer 60seconds"), 60);
console.log(extractTime("timer for 60s"), 60);
console.log(extractTime("banoodles"), 60);
