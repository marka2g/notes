// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from
function getMin(input_array) {
  const ary = Array.from(input_array) //1 operation
  let min; //1 operation

  // Line 9-13: it is a loop that executes size of n times
  // 2 operations inside the forEach block
    //1 operation to loop
  ary.forEach(element => {
    //and 1 operation to check
    if (min === undefined || element < min) {
      min = element;
    }
  });
  //1 operation
  return min;
}

// All in all, we have 3 operations outside the loop and 2 inside the forEach block. Since the loop goes for the size of n, this leaves us with 2(n) + 3.
//

// Operation Breakdown
//A. average case: random order
// console.log(getMin([9, 20, 49, 4, 39]));
getMin([9, 20, 49, 4, 39]);
//B. best case: sorted array
// console.log(getMin([4, 9, 20, 39, 49]));
getMin([4, 9, 20, 39, 49]);
//C. worst case: reverse sorted order
// console.log(getMin([49, 39, 20, 9, 4]));
getMin([49, 39, 20, 9, 4]);

// A. average case - iterations:
// console.log(`element is: ${element} and min is: ${min}`);
1. element = 9
  // let min;
  min is: undefined
  element < min //false but
  min === undefined //true
  // min = element;
  min = 9

2. element = 20
  // let min;
  min is: 9
  element < min //false
  min === undefined //false
  min = 9

3. element = 49
  min is: 9
  element < min //false
  min === undefined //false
  min = 9

4. element = 4
  min is: 9
  element < min //true
  min === undefined //false
  // min = element;
  min = 4

5. element = 39
  min is: 4
  element < min //false
  min === undefined //false
  last_return - min = 4
