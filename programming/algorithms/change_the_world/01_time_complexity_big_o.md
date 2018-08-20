#
[1. data structures for beginners - time complexity](https://adrianmejia.com/blog/2018/04/04/how-you-can-change-the-world-learning-data-structures-algorithms-free-online-course-tutorial/)

```javascript
function getMin(input_array) {
  // 3 operations not in forEach block
  const ary = Array.from(input_array) //1 operation
  let min; //1 operation

  // loop executes size of n times
  // 2 operations inside the forEach block
  ary.forEach(element => {
    //1 operation to check
    if (min === undefined || element < min) {
      //1 operation to assign or not assign
      min = element;
    }
  });
  //1 operation
  return min;
}
```
### O(n) Running Time

| n(size)       | operations      | result  |
| ------------- |:---------------:| -------:|
| 1             | 2(1) + 3        | 5       |
| 10            | 2(10) + 3       | 23      |
| 100           | 2(100) + 3      | 203     |
| 1000          | 2(1000) + 3     | 2,003   |
| 10,000        | 2(10,000) + 3   | 20,003  |

> Believe it or not also k wouldn’t make too much of a difference. Using this kind of asymptotic analysis we take the higher order element, in this case: n.

> The letter O refers to the order of a function.
