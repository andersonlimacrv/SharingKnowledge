### Functions Assigned to Variables

```html
In JavaScript, functions are a data type just as strings, numbers, and arrays are data types. Therefore, functions can be assigned as values to variables, but are different from all other data types because they can be invoked.
```

```js
let plusFive = (number) => {
  return number + 5;  
};
// f is assigned the value of plusFive
let f = plusFive;
 
plusFive(3); // 8
// Since f has a function value, it can be invoked. 
f(9); // 14
```


### Callback Functions

```html
In JavaScript, a callback function is a function that is passed into another function as an argument. This function can then be invoked during the execution of that higher order function (that it is an argument of).

Since, in JavaScript, functions are objects, functions can be passed as arguments.
```

```js
const isEven = (n) => {
  return n % 2 == 0;
}
 
let printMsg = (evenFunc, num) => {
  const isNumEven = evenFunc(num);
  console.log(`The number ${num} is an even number: ${isNumEven}.`)
}
 
// Pass in isEven as the callback function
printMsg(isEven, 4); 
// Prints: The number 4 is an even number: True.
```

### Higher-Order Functions
```html
In Javascript, functions can be assigned to variables in the same way that strings or arrays can. They can be passed into other functions as parameters or returned from them as well.

A “higher-order function” is a function that accepts functions as parameters and/or returns a function.
```


[source](https://www.codecademy.com/learn/game-dev-learn-javascript-higher-order-functions-and-iterators/modules/game-dev-learn-javascript-iterators/cheatsheet#)