function count(cart) {
   const dic = {};
   for(i = 0; i < cart.length ; i++) {
      if(!!dic[cart[i].name]) {
         dic[cart[i].name] += cart[i].cost;
      } else {
         dic[cart[i].name] = cart[i].cost;
      }
   }
   // console.log(dic);
   return dic;
}

function sorted(count_cart){
   var cart_keys = Object.keys(count_cart);
   return cart_keys.sort();
}

function print_cart(cart_count, cart_sort){
   for (i = 0; i < cart_sort.length; i++){
      console.log(cart_sort[i]+" "+cart_count[cart_sort[i]]);
   }
}

function countCart(cart){
   var cart_count = count(cart);
   var cart_order = sorted(cart_count);
   print_cart(cart_count,cart_order);
}



const cart = [
   {
     name: 'Strawberry',
     cost: 6.70
   },
   {
     name: 'Orange',
     cost: 4.50
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
    name: 'Orange',
    cost: 4.50
  },
  {
    name: 'Apple',
    cost: 2.30
  }
];

countCart(cart);
