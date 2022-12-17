### what is React Context
- The React context provides data to components no matter how deep they are in the components tree.
The context is used to manage global data, e.g. global state, theme, services, user settings, and more.

### How to use the context
- Using the context in React requires 3 simple steps:
creating the context, providing the context, and consuming the context.

1. Creating the context
```js
import { createContext } from 'react';
const Context = createContext('Default Value');
// The factory function accepts one optional argument: the default value.
```

2. Providing the context
```js
// Context.Provider component available on the context instance is used to provide the context to its child components, no matter how deep they are.

// To set the value of context use the value prop available on the <Context.Provider value={value} />:
function Main() {
  const value = 'My Context Value';
  return (
    <Context.Provider value={value}>
      <MyComponent />
    </Context.Provider>
  );
}

// Again, what's important here is that all the components that'd like later to
// consume the context have to be wrapped inside the provider component.

// If you want to change the context value, simply update the value prop.
```
3. Consuming the context

```js
// Consuming the context can be performed in 2 ways.
// The first way, the one I recommend, is to use the useContext(Context) React hook:
// The hook returns the value of the context: value = useContext(Context).
// The hook also makes sure to re-render the component when the context value changes.

import { useContext } from 'react';
function MyComponent() {
  const value = useContext(Context);
  return <span>{value}</span>;
}


// The second way is by using a render function supplied as a child
// to Context.Consumer special component available on the context instance:

function MyComponent() {
  return (
    <Context.Consumer>
      {value => <span>{value}</span>}
    </Context.Consumer>
  );
}
```

### When to use
- global state
- theme
- application configuration
- authenticated user name
- user settings
- preferred language
- a collection of services


[source](https://dmitripavlutin.com/react-context-and-usecontext/)
