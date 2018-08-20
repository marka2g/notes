# Time Complexities

[big o for rubyists](http://blog.honeybadger.io/a-rubyist-s-guide-to-big-o-notation/)
```ruby
# O(2^n) translated to Ruby
def o(n)
  2 ** n  # This is ruby for 2^n
end
Still not obvious? How about if I rename the method and argument to something more user-friendly?

# O(2^n) translated to prettier Ruby
def execution_time(size_of_dataset)
  2 ** size_of_dataset
end
You can do this for all of them:

# O(1)
def o1_execution_time(size_of_dataset)
  1
end

# O(n)
def on_execution_time(size_of_dataset)
  size_of_dataset
end

# O(n^2)
def on2_execution_time(size_of_dataset)
  size_of_dataset * size_of_dataset
end

```


##[8 Time Complexities Every Programmer Should Know](https://adrianmejia.com/blog/2018/04/05/most-popular-algorithms-time-complexity-every-programmer-should-know-free-online-tutorial-course/)

## BigO Cheatsheets

| BigO Notation | Name             | Examples                                  |
| ------------- |:----------------:| -----------------------------------------:|
| O(1)          | Constant         | Odd or Even number,                       |
|               |                  | Look-up table (on average)                |
| O(log n)      | Logarithmic      | Find elmnts on srtd ary with binary search|
| O(n)          | Linear           | Find max elmnt in unsrtd array,           |
|               |                  | Duplicate elements in array with Hash Map |
| O(n log n)    | Linearithmic     | Sorting elements in array with merge sort |
| O(n^2)        | Quadratic        | Duplicate elements in array (naïve)       |
|               |                  | Sorting array with bubble sort            |
| O(n^3)        | Cubic            | 3 variables equation solver               |
| O(2^n)        | Exponential      | Find all subsets                          |
| O(n!)         | Factorial        | Find all permutations of a gvn set/string |

...put whiteboards here - array v list

### 1. O(1) Constant Time

> take the same amount of time regardless of the size of the input

#### example 1: Odd or Even
```javascript
function isEvenOrOdd(n) {
  // if 1 is returned, its odd. 0 modulus means no remainder, means even
  return n % 2 ? 'Odd' : 'Even'
  //// or use the bitwise &
  // return n & 1 ? 'Odd' : 'Even'
}

// isEvenOrOdd(10) // => Even
// isEvenOrOdd(109898983) // => odd
```

> Do not be fool by one-liners. They don’t always translate to constant times. You have to be aware of how they are implemented. If you have a method like `Array.sort()` or any other array or object methods you have to look into the implementation to determine its running time.

Primitive operations like sum, multiplication, subtraction, division, modulo, bit shift, etc have a constant runtime. This can be shocking!


#### example 2: Look-up Table / Hash Table(Ruby)
given a string, find its(already calculated) word frequency

```javascript
const dictionary = { the: 22038615, be: 12545825, and: 10741073, of: 10343885, a: 10144200, in: 6996437, to: 6332195};

function getWordFrequency(dictionary, word) {
  return dictionary[word];
}

getWordFrequency(dictionary, 'the');
getWordFrequency(dictionary, 'in');
```

```ruby
# O(1) Constant Time
class ConstantTime
  def initialize
  end

  def even_or_odd?(number)
    number % 2 ? 'Odd' : 'Even'
    # bitwise also works
    # @number & 1 ? 'Odd' : 'Even'
  end

  # MashMap/ Hash/ LookupTable
  def lookup_table(word)
    words_used = {the: 22038615, be: 12545825, and: 10741073, of: 10343885, a: 10144200, in: 6996437, to: 6332195, blah: 98498984, meh: 99023977}

    words_used[word.to_sym].present? ?
    words_used[word.to_sym] : 0
  end
end
# runit
# ct = ConstantTime.new
# ct.even_or_odd?(3887)
# ct.lookup_table('blah')
```

### 2. O(n) Linear Time
> say you want to find the max value of an unsorted array

#### example 1: iterate thru an array to find max value

```javascript
function findMax(ary_of_nums) {
  let max;
  let counter = 0;

  for (var i = 0; i < ary_of_nums.length; i++) {
    counter++;
    if (max === undefined || max < ary_of_nums[i]) {
      max = ary_of_nums[i];
    }
  }
  // console.log(`ary_of_nums: ${ary_of_nums.length}, counter: ${counter}`);
  // return max;
  return `max: ${max}, ary_of_nums: ${ary_of_nums.length}, counter: ${counter}`;
}
```
```ruby
# O(n) Linear Time
class LinearTime
  def initialize
  end

  def largest_unsorted_item(array)
    max, counter = 0, 0

    array.each do |element|
      counter += 1
      if max <= 0 || max < element
        max = element
      end
    end

    [max, counter]
    puts "Max = #{max} and the Cost = #{counter}🍔s"
  end
end
# lt = LinearTime.new
# lt.largest_unsorted_item([2,6,3,88,32,9])
# lt.largest_unsorted_item((1..20000000).to_a)
```

How many operations will the `findMax([2, 44, 32, 65, 1, 88])` do?
If you get the time complexity it would be something like this:

- Line 2-3: 2 operations
- Line 4: a loop of size n
- Line 6-8: 3 operations inside the for-loop.

So, this gets us `3(n) + 2`. => drop the coefficient and additions -> 6


### 3. O(n^2) Quadratic Time
> A for loop in a for loop... If the input is size 2, it will do roughly 4 operations.  If the input is size 8, then it will take 64, and so on

#### example 1: naïve solution to find duplicate words in any array

```javascript
function hasDuplicates(input_ary) {
  const duplicates = [];
  let counter = 0;

  for (var outter = 0; outter < input_ary.length; outter++) {
    for (var inner = 0; inner < input_ary.length; inner++) {
      counter++;

      if(outter === inner) continue;

      if(input_ary[outter] === input_ary[inner]) {
          // return true;
          return `...exits early - Duplicates Found! - Stats: input_ary length: ${input_ary.length}, counter: ${counter}`;
      }
    }
  }
   // console.log(`input_ary length: ${input_ary.length}, counter: ${counter}`);
   // return false;
   return `No Duplicates Found - Stats: input_ary length: ${input_ary.length}, counter: ${counter}`
}
```

```ruby
class QuadraticTime
  def initialize
  end

  def has_duplicates?(array)
    total_loop_counter = 0

    array.each do |outer_item|
      array.each do |inner_item|
        total_loop_counter += 1
        next if outer_item === inner_item
        return true if array[outer_item] === array[inner_item]
      end
    end
    puts "Size of input_array = #{array.length} and Cost = #{total_loop_counter}🍔s"
    false
  end
end

# runit
# qt = QuadraticTime.new
# qt.has_duplicates?([2, 8, 3, 5, 24, 3, 8, 3])
```
How many operations will the `hasDuplicates([2, 44, 32, 65, 1, 88, 2])` do?
Time complexity analysis:

- Line 2-3: 2 operations
- Line 5-6: double-loop of size n, so n^2.
- Line 7-13: has ~3 operations inside the double-
We get `3n^2 + 2`. -> `n^2` -> `O(n^2)`
<!-- "No Duplicates Found - Stats: input_ary length: 6, counter: 36" -->


#### example 2: Bubble Sort
> We want to sort the elements in an array.

```javascript
function bubbleSort(array_input) {
  for (let outer = 0; outer < array_input.length; outer++) {
    let outerElement = array_input[outer];

    // compare the first to the next
    for (let inner = outer + 1; inner < array_input.length; inner++) {
      let innerElement = array_input[inner];

      if (outerElement > innerElement) {
        // swap
        array_input[outer] = innerElement;
        array_input[inner] = outerElement;
        // update references
        outerElement = array_input[outer];
        innerElement = array_input[inner];
      }
    }
  }
  return array_input;
}
```

```ruby
class QuadraticTime
  attr_reader :array

  def initialize(unsorted_array)
    @array = unsorted_array
  end
  def bubble_sort
    @array.each_with_index do |outer_element, outer_index|
      @array.each_with_index do |inner_element, inner_index|
        if outer_element < inner_element
          # swap
          @array[outer_index], @array[inner_index] = inner_element, outer_element
          # update_references
          outer_element, inner_element = @array[outer_index], @array[inner_index]
        end
      end
    end
    @array
  end
end

#runit
# qt = QuadraticTime.new([77, 6, 3, 8, 44, 26, 77, 12, 2, 1].uniq)
# qt.bubble_sort
```
2 nested loops and quadratic running time: `O(n^2)`

### 4. O(n^c) Polynomial Time (when c > 1)
 where `x, y and z < n`

```javascript
// triple nested for loop.  f.i. if you want to find the answer to:
// 3x + 9y + 8z = 79

function findXYZ(num) {
  const solutions = [];

  for (var x = 0; x < num; x++) {
    for (var y = 0; y < num; y++) {
      for (var z = 0; z < num; z++) {
        if(3*x + 9*y + 8*z === 79) {
          solutions.push({x, y, z});
        }
      }
    }
  }
  return solutions;
}
findXYZ(10); // => [{x: 0, y: 7, z: 2}, ...]
```
```ruby
class PolynomialTime
  attr_reader :number

  def initialize(input_number)
    @number = input_number
  end

  def find_xyz
    x, y, z = 0, 0, 0
    solutions = []

    for a in (0..@number).to_a
      x = a
      a += 1
      for b in (0..@number).to_a
        y = b
        b += 1
        for c in (1..@number).to_a
          z = c
          c += 1
          if(3*x + 9*y + 8*z === 79)
            solutions.push({x: x, y: y, z: z})
          end
        end
      end
    end
    solutions
  end
end

# pt = PolynomialTime.new(10)
# pt.find_xyz # => [{x: 0, y: 7, z: 2}, ....]
```

This algorithm has a cubic running time: `O(n^3)`

### 5. O(log n) Logarithmic Time - Binary Search - Recursive Functions
> Logarithmic time complexities usually apply to algorithms that divide problems in half every time. For instance, let’s say that we want to look for a person in an old phone book. It has every name sorted alphabetically. There are at least two ways to do it:

```javascript
// triple nested for loop.  f.i. if you want to find the answer to:
// 3x + 9y + 8z = 79

function indexOf(array, element, offset = 0) {
  // split array in half
  const half = parseInt(array.length / 2);
  const current = array[half];

  if (current === element) {
    return offset + half;
  } else if(element > current) {
    const right = array.slice(half);
    return indexOf(right, element, offset + half);
  } else {
    const left = array.slice(0, half)
    return indexOf(left, element, offset);
  }
}

const friends = ['Kevin', 'Alex', 'Stuart', 'Michael', 'Davy', 'Stanley', 'Mike', 'Hau', 'Jeremy', 'Lolo'];
indexOf(friends, 'Davy');
indexOf(friends, 'Kevin');
indexOf(friends, 'Stuart');
```

```ruby
# O(log n) Logarithmic Time
class LogarithmicTime
  def initialize
  end
  def index_of(array, element, offset = 0)
    half = (array.length / 2).to_int
    current = array[half]

    if current == element
      return offset + half
    elsif element > current
      # right = array.slice(half..-1)
      right = array.slice(half)
      index_of(right, element, offset + half)
    else
      # left = array.slice(0..half)
      left = array.slice(0, half)
      index_of(left, element, offset)
    end
  end
end

# friends = ['Kevin', 'Alex', 'Stuart', 'Michael', 'Davy', 'Stanley', 'Mike', 'Hau', 'Jeremy', 'Lolo', 'Ryan'].sort
# lt = LogarithmicTime.new
# lt.index_of(friends, 'Davy')
# lt.index_of(friends, 'Kevin')
# lt.index_of(friends, 'Stuart')
```

#### Master Method for Recursive Algorithms
`O(log(n))`

##### 3 things we care about:
i. runtime of work done outside the recursion
ii. how many recursive calls the problem is divided into. Binary -> 1 recrsive call.  Notice that only one or the other will happen, never both.
iii. how much `n` is reduced on each recursive call: `1/2` every recusive call cuts n in half.

1. > `T(n) = aT(n/b) + f(n)` where:

- `n:` size of the recursion problem.
- `a:` the number of subproblems.  in binary search, we only split the problem into another subproblem.
- `b:` the factor by which `n` is reduced. for our case, we divide `n` in half each time.
- `f(n):` the running time outside the recursion. `O(1)`

2. > Once we know the values of `a`, `b` and `f(n)` we can determine the runtime of the recursion. `n logb^a`

3. > finally we compare the recursion time from step 2 and the runtime `f(n)` from step 1. Based on that, we have the following cases:

##### Case 1: Most of the work is done in the recursion
`nlogb^a > f(n)` then runtime is: `O(nlog^a)`

##### Case 2: The work done in the recursion and outside the recursion is the same.
`If nlogba === f(n)` then runtime is: `O(nlogb^a log(n))`

##### Case 3: Most of the work is done outside the recursion.
`If nlogba < f(n)` then runtime is: `O(f(n))`

Combining everything,

#### Master Method for Binary Search
`T(n) = a T(n/b) + f(n)`

1. find `a`, `b` and `f(n)` and replace the formula.
- `a:` the number of subproblems; in binary search, we only split the problem into another subproblem. So `a=1`
- `b:` the factor by which `n` is reduced. We divide `n` in half each time. So `b=2`
- `f(n):`the running outside the recursion: `O(1)`

Thus,
> `T(n) = T(n/2) + O(1)`

... using substitution, in the end we get `O(log(n))`


### 6. O(n log n) Linearithmic Time - Merge Search - Recursive Function
> Linearithmic time complexity it’s slightly slower than a linear algorithm but still much better than a quadratic algorithm (you will see a graph at the very end of the post).

#### Mergesort - it has 2 functions: `sort()` and `merge()`
1. Divide the array recursively until the elements are two or less.
2. We know how to sort 2 items, so we sort them iteratively (base case).
3. The final step is merging; we merge in, taking in one by one from each array suck that they are in ascending order.

```javascript
function sort(ary) {
  const length = ary.length;

  // base case - we get to the end
  if (length === 1) {
    return ary;
  }
  if (length === 2) {
    return ary[0] > ary[1] > [ary[1], ary[0]] : [ary[0], ary[1]];
  }
  // split and merge
  const mid = length/2;
  return merge(sort(ary.slice(0, mid)), sort(ary.slice(mid)));
}

function merge(ary_one = [], ary_two = []) {
  const merged = [];
  // merge elements a and b in asc order.  Runtime O(a + b)
  for (let ai = 0, bi = 0; ai < ary_one.length || bi < ary_two.length;) {
    if (ai >= ary_one.length || ary_one[ai] > ary_two[bi]) {
      merged.push(ary_two[bi++]);
    } else {
      merged.push(ary_one[ai++]);
    }
  }

  return merged;
}
```

```ruby
# O(n log n) Linearithmic Time - Merge Search - Recursive Function
class Linearithmic
  def initialize
  end

  def sort(arr)
    if arr.length <= 1
      arr
    else
      midway = (arr.length / 2).floor
      left = sort(arr[0..midway -1])
      right = sort(arr[midway..arr.length])
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end
end

# arr = [4, 1, 5, 1, 33, 312, 88, 6]
# la = Linearithmic.new
# p la.sort(arr)
```
