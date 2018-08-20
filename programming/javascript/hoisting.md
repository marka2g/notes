[hoisting tut](https://scotch.io/tutorials/understanding-hoisting-in-javascript)

## ES6
### var
> the scope of a variable declared with the keyword var is its current execution context. This is either the enclosing function or for variables declared outside any function, global

global example

```javascript
console.log(hoist); // Output: undefined
var hoist = 'The variable has been hoisted.';
```

We expected the result of the log to be: ReferenceError: hoist is not defined, but instead, its output is


function scoped
```javascript
function hoist() {
  console.log(message);
  var message='Hoisting is all the rage!'
}

hoist();
```

outputs `undefined`


### let
> block scoped and not function scoped.  iow, the variable's scope is bound to the block in which it is declared and not the function

```javascript
console.log(hoist); // Output: ReferenceError: hoist is not defined ...
let hoist = 'The variable has been hoisted.';
```

notice, `ReferenceError` NOT `undefined`

```javascript
let hoist;

console.log(hoist); // Output: undefined
hoist = 'Hoisted'
```

> to err on the side of caution, we should declare then assign our variables to a value before using them.


### const
> allows immutable variables, i.e. variables whose value cannot be modified once assigned. With const, just as with let, the variable is hoisted to the top of the block.

go ahead, try to reassign, i dare u...

```javascript
const PI = 3.142;
PI = 22/7; // Let's reassign the value of PI
console.log(PI); // Output: TypeError: Assignment to constant variable.
```

how `const` alters var declaration

```javascript
console.log(hoist); // Output: ReferenceError: hoist is not defined
const hoist = 'The variable has been hoisted.';
```

Much like the let keyword, instead of silently exiting with an undefined, the interpreter saves us by explicitly throwing a Reference error.

and same with functions

```javascript
function getCircumference(radius) {
  console.log(circumference)
  circumference = PI*radius*2;
  const PI = 22/7;
}

getCircumference(2) // ReferenceError: circumference is not defined
```

## function hoisting 

```javascript
```
```javascript
```
```javascript
```
```javascript
```
```javascript
```
