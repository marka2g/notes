## [reactjs](reactjs/README.md)


#### links & posts

#### reducers
[example reducer implementation repo]([example repo](https://github.com/salsita/flux-boilerplate))
[reducers, stateless stores](https://blog.javascripting.com/2015/06/19/flux-no-more-stores-meet-reducer/)
> A stateless store is nothing more than a reduce function of actions into applicationState.


[immutable data structures](https://blog.javascripting.com/2015/03/31/turbocharge-your-react-application-with-shouldcomponentupdate-and-immutable-js/)


[js spread operator ...](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

[webpack effed up](https://medium.com/@dan_abramov/two-weird-tricks-that-fix-react-7cf9bbdef375)

[redux with react](https://redux.js.org/basics/usage-with-react)
[redux](https://redux.js.org)
[react redux](https://github.com/reduxjs/react-redux)
[dummy's guide to redux thunk](https://medium.com/@stowball/a-dummys-guide-to-redux-and-thunk-in-react-d8904a7005d3)
[the repo](https://github.com/stowball/dummys-guide-to-redux-and-thunk-react)

[redux thunk](https://github.com/reduxjs/redux-thunk)
> Redux Thunk middleware allows you to write action creators that return a function instead of an action. The thunk can be used to delay the dispatch of an action, or to dispatch only if a certain condition is met. The inner function receives the store methods dispatch and getState as parameters.

```JavaScript
const INCREMENT_COUNTER = 'INCREMENT_COUNTER';

function increment() {
  return {
    type: INCREMENT_COUNTER
  };
}

function incrementAsync() {
  return dispatch => {
    setTimeout(() => {
      // Yay! Can invoke sync or async actions with `dispatch`
      dispatch(increment());
    }, 1000);
  };
}
```
> An action creator that returns a function to perform conditional dispatch:

```JavaScript
function incrementIfOdd() {
  return (dispatch, getState) => {
    const { counter } = getState();

    if (counter % 2 === 0) {
      return;
    }

    dispatch(increment());
  };
}
```
