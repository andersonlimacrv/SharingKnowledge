[source](https://reactjs.org/docs/faq-functions.html)


```js
<Button onPress={handleConfirm} />

// or

<Button onPress={() => handleConfirm()} />
```
### both way is the same


### Note:

```html
Using an arrow function in render creates a new function each time the component renders,
which may break optimizations based on strict identity comparison.
```

### Arrow Function in Render

```js
class Foo extends Component {
  handleClick() {
    console.log('Click happened');
  }
  render() {
    return <button onClick={() => this.handleClick()}>Click Me</button>;
  }
}
```
