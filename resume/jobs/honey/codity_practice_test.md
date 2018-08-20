# Practice Test - Smallest Positive Integer

### Solution, USE A SET!!!! DUH!
```ruby
require 'set'
def solution(a)
  set = a.to_set
  num = 1

  while set.include? num
    num += 1
  end
  num
end
#  array  = [1, 3, 6, 4, 1, 2]
# solution(array)
```

[codeity practice](https://app.codility.com/demo/results/demoWJCCTD-J6J/)

### intertubes solutions
[code review stackexchange](https://codereview.stackexchange.com/questions/179037/given-an-array-of-integers-return-the-smallest-positive-integer-not-in-it)

```javascript
var firstMissingPositive = function(nums) {
    var swap = function(i, j) {
        var tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    };

    for (let i = 0; i < nums.length; i++) {
        while (0 < nums[i] && nums[i] - 1 < nums.length
                && nums[i] != i + 1
                && nums[i] != nums[nums[i] - 1]) {
            swap(i, nums[i] - 1);
        }
    }

    for (let i = 0; i < nums.length; i++) {
        if (nums[i] != i + 1) {
            return i + 1;
        }
    }
    return nums.length + 1;
};
```

and

```javascript
function findNumber(values) {
  let result = [];

  for (let i = 0; i < values.length; ++i) {
    if (0 <= values[i]) {
      result[values[i]] = true;
    }
  }

  for (let i = 1; i <= result.length; ++i) {
    if (undefined === result[i]) {
      return i;
    }
  }

  return 1
}
```

1. %11 out of %100 - YIKES!

array_set = [1, 3, 6, 4, 1, 2]
<!-- array_set = [1, 2, 3, 4, 5, 6, 8, 9, 10].sort.uniq -->
<!-- array_set = [1, 2, 4, 5, 6, 7].sort.uniq -->
array_set = [-1, -3].sort.uniq
array_set = [1, 2, 3].sort.uniq
array_set = (1..100000).to_a.sort.uniq
array_set = [2].sort.uniq
solution(array_set)

```ruby
def solution(a)
  a = a.sort.uniq
  return smallest_positive(a.last) if a.length <= 1 || a.last < 0
  first, second = a[0], a[1]

  if first + 2 == second
    return first + 1
  else
    solution(a[1..a[-1]])
  end
end

def smallest_positive(num)
  num < 0 ? 1 : num + 1
end
```
