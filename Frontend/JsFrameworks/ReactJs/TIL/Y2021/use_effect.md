```js
// With ccomponentDidMount()
componentDidMount() {
    console.log('Hello World');
}

// with useEffect()
useEffect(() => {
    console.log('Hello World');
}, [])

```

```js
// With ccomponentDidUpdate()
componentDidUpdate(prevProps) {
    console.log(`Hello World ${prevProps}`);
}

// with useEffect()
useEffect(() => {
    console.log('Hello World');
}, [prevProps])
```


```js
// With ccomponentDidUnmount()
componentWillUnmount() {
    console.log('Hello World');
}

// with useEffect()
useEffect(() => {
    console.log('Hello World');
    return () => {
        console.log('Do some cleanup');
    }
}, [])
```
