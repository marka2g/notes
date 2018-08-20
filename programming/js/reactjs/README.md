## *on deck views & reads*
- [pluralsite reactjs](https://app.pluralsight.com/library/search?i=1&m_Sort=relevance&q=react&q1=course&q2=Beginner%7CIntermediate%7CAdvanced&x1=categories&x2=skillLevels)

[react-router integration](https://tighten.co/blog/react-101-routing-and-auth/#part-3)
[catbook notes IV](https://www.thegreatcodeadventure.com/react-redux-tutorial-part-iv-the-index-feature/)

mapStateToProps - connect method takes an argument, mapStateToProps & its functions are:
- receive application state from the store whenever state has changed
- make data from the data available to the component as `props`

Functional components(*ie presentational components or stateless functional components*)
- is small, stateless, function definitions provide a clean, eloquent interface
```javascript
const CatList = ({cats}) => {
  return ()
};
```
- take in an argument of props, which are passed in when the component is called.
- don't have an explicit render method, instead they render whatever is returned
take a look at this post on *stateless functional components*
- don't have an explicit render method, instead they render whenever is returned.

[react's key property](https://blog.arkency.com/2014/10/react-dot-js-and-dynamic-children-why-the-keys-are-important/

#### redux
  [cartoon redux](https://code-cartoons.com/a-cartoon-intro-to-redux-3afb775501a6)
  > Reducers - they make a copy and make all their changes on the copy. The state object isn’t manipulated directly. Instead, each slice is copied and then all of the slices are combined into a new state object. The reducers pass their copies back to the root reducer, which pastes the copies together to form the updated state object. Then the root reducer sends the new state object back to the store, and the store makes it the new official state. In Redux, the reducers are in a hierarchy. This hierarchy can have as many levels as needed, just like the component hierarchy.
  - smart components -> pass down actions to dumb components via props.
  - dumb components ->  don’t depend on action files directly .can be reused in a different app that has different logic since all actions are passed in via props. They also contain the styles that they need to look reasonably good (though you can allow for custom styling — just accept a style prop and merge it in to the default styles).

  > react-redux - the view layer binding.  connects the store to the view.  the IT department for the view tree.  It makes sure that all of the components can connect to the store. It also takes care of a lot of technical details so that the rest of the hierarchy doesn’t have to understand them.
  1. The Provider component: This is wrapped around the component tree. It makes it easy for the root component’s children to hook up to the store using connect().
  2. connect(): This is a function provided by react-redux. If a component wants to get state updates, it wraps itself using connect(). Then the connect function will set up all the wiring for it, using the selector.
  3. selector: This is a function that you write. It specifies what parts of the state a component needs as properties.

  > the root component - All React applications have root components. This is just the component at the top level of the component hierarchy. But in Redux applications, this component takes on more responsibility. The role it plays is kind of like a C-level executive. It puts all of the teams in place to tackle the work. It creates the store, telling it what reducer to use, and brings together the view layer binding and the views. The root component is pretty hands-off after it initializes the app, though. It doesn’t get caught up in the day-to-day concerns of triggering re renders. It leaves that to the components below it, assisted by the view layer binding.


#### flux - not used anymore so much in favor of redux
[A cartoon guide to Flux](https://code-cartoons.com/a-cartoon-guide-to-flux-6157355ab207)


#### super() in an ES6 constructor
1.
[all about super() in a component constructor](http://cheng.logdown.com/posts/2016/03/26/683329)
```javascript
class MyClass extends React.Component {
  constructor(){
    console.log(this) //Error: 'this' is not allowed before super()
  }
}
```
`[this is uninitialized if super() is not called](http://stackoverflow.com/questions/31067368/javascript-es6-class-extend-without-super/31079103#31079103)`

>ES6 class constructors MUST call super if they are subclasses. Thus, you have to call super() as long as you have a constructor. (But a subclass does not have to have a constructor)

2. Call super(props) only if you want to access this.props inside the constructor. React automatically set it for you if you want to access it anywhere else.
```javascript
class MyClass extends React.Component{
  constructor(props){
    super(props);
    console.log(this.props); // prints out whatever is inside props
  }
}
```

#### binding `this` to component functions
`this.toggleEdit = this.toggleEdit.bind(this)`
The new es6 syntax for creating components, React.Component {} does not autobind this for us. So, we do it ourselves in the constructor function.

#### componentWillReceiveProps with mapStateToProps
ensures that our component's internal state, which gets its cat, catHobbies and checkBoxHobbies properties from the component's props, gets updated when those props change

#### [state v props](http://lucybain.com/blog/2016/react-state-vs-pros/) and [react-guide props v state](https://github.com/uberVU/react-guide/blob/master/props-vs-state.md)
... `props` are a way of passing data from parent to child. ... `state` is reserved only for interactivity, that is, data that changes over time.
[react guide](https://facebook.github.io/react/docs/thinking-in-react.html)

- If a Component needs to alter one of its attributes at some point in time, that attribute should be part of its `state`, otherwise it should just be a `prop` for that Component.

##### props
props (short for properties) are a Component's configuration, its options if you may. They are received from above and immutable as far as the Component receiving them is concerned. A Component cannot change its props, but it is responsible for putting together the props of its child Components.

##### state
The state starts with a default value when a Component mounts and then suffers from mutations in time (mostly generated from user events). It's a serializable* representation of one point in time—a snapshot.
A Component manages its own state internally, but—besides setting an initial state—has no business fiddling with the state of its children. You could say the state is private.

#### Changing _props_ and _state_

| | _props_ | _state_ |
--- | --- | ---
Can get initial value from parent Component? | Yes | Yes
Can be changed by parent Component? | Yes | No
Can set default values inside Component?* | Yes | Yes
Can change inside Component? | No | Yes
Can set initial value for child Components? | Yes | Yes
Can change in child Components? | Yes | No

\* Note that both _props_ and _state_ initial values received from parents override default values defined inside a Component.

> props contains information set by the parent component (although defaults can be set) and should not be changed.
> state contains “private” information for the component to initialize, change, and use on it’s own.

> setState triggers a call to render

also, `onClick={() => this.updateCount()}` means that when the button is clicked the updateCount method will be called. We need to use ES6’s arrow function so updateCount will have access to this instance’s state.
[ES6’s arrow function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)

#### react/virtual dom/graphs
[fullstack academy - virtual dom talk](https://www.youtube.com/watch?v=mLMfx8BEt8g)

#### full stack react
[30 days of react](https://github.com/fullstackreact/30-days-of-react/tree/day-1)

#### inner workings of virtual DOM
[v dom](https://medium.com/@rajaraodv/the-inner-workings-of-virtual-dom-666ee7ad47cf)
#### REST
[rest example](https://github.com/marmelab/admin-on-rest-demo)
[admin panel - demo/demo](https://marmelab.com/admin-on-rest-demo/#/commands)

### reactjs rocks - examples
#### filter/trees
[filter trees sort](https://react.rocks/tag/Filter)
#### crud examples
[react rocks 42 CRUDS](https://react.rocks/tag/CRUD)
[made with react](http://madewithreact.com)
  - [git cheatsheet](http://madewithreact.com/git-cheat-sheet/)
#### crud examples
[shopping cart](https://react.rocks/tag/ShoppingCart)
#### markdown/kajero
[step by step](https://evdokimovm.github.io/javascript/reactjs/localstorage/webstorage/2016/08/27/reactjs-markdown-editor-step-by-step.html)
[kaj source](https://github.com/JoelOtter/kajero/blob/master/src/js/Notebook.js)
[how to render md form react component](https://stackoverflow.com/questions/31875748/how-do-i-render-markdown-from-a-react-component)
import Markdown from 'react-markdown'
[react rocks](https://react.rocks/tag/Markdown)
[editor](https://github.com/andrerpena/react-mde)
[md react](http://alexkuz.github.io/markdown-react-js/)


#### notes-magoats
[mockapi](https://www.mockapi.io/projects/5b4030eedf7b41001470ac3e)
