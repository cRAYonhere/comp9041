function count(cart){
   const dic = {};
   for(i = 0; i < cart.length ; i++){
      if(!!dic[cart[i]]){
         dic[String(cart[i])]++;
      } else {
         dic[String(cart[i])] = 1;
      }
   }
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
  },
  {
    name: 'Orange',
    cost: 4.50
  }

];

countCart(cart);
