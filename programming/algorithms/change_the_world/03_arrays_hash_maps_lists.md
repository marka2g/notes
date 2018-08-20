# Linear Data Structures

##[Data Structures for Beginners: Arrays, HashMaps, and Lists](https://adrianmejia.com/blog/2018/04/28/data-structures-time-complexity-for-beginners-arrays-hashmaps-linked-lists-stacks-queues-tutorial/#HashMaps)


## Array

### Array Time Complexities

| Operation                     | Worst    |
|:-----------------------------:| --------:|
| Access(Array.[])              | O(1)     |
| Insert head (Array.unshift)   | O(n)     |
| Insert tail(Array.push)       | O(1)     |
| Search(for value)             | O(n)     |
| Delete(Array.splice)          | O(n)     |


## Hash Maps
The "labeled bin"

| Operation                | Worst  | Amortized  | Comments                   |
|:------------------------:| ------:| ----------:| --------------------------:|
| Access(HashMap.get)      | O(n)   | O(1)       | O(n) is an extreme case<br> when too many collisions |
| Insert/Edit(HashMap.set) | O(n)   | O(1)       | O(n) only when rehash<br> .75 full|
| Delete(HashMap.delete)   | O(n)   | O(1)       | O(n) too many collisions   |
