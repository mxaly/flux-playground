# @cjsx React.DOM

React = require('React/addons')
Fluxxor = require("fluxxor")
FluxChildMixin = Fluxxor.FluxChildMixin(React)
StoreWatchMixin = Fluxxor.StoreWatchMixin

TodoItemComponent = require './todo_item'

ToDoListComponent = React.createClass
  mixins: [FluxChildMixin, StoreWatchMixin("TodosStore"), React.addons.LinkedStateMixin]


  getInitialState: ->
    newDescriptionText: ""

  getStateFromFlux: ->
    flux = @getFlux()
    todos: flux.store("TodosStore").getState()

  componentDidMount: ->
    @getFlux().actions.todos.load()

  render: ->
    <section className="application-container">
      <div className="todos-collection">
        <div clasName="row"> To do: </div>
        {
          @state.todos.collection.map (todo, i) =>
            <TodoItemComponent key=i todo={todo}/>
        }
        <form onSubmit={ @onNewTodoSubmit } className='form-inline new-todo-form row'>
          <div className='form-group col-xs-6'>
            <input  type="text"
                    size='60'
                    placeholder="Description..."
                    valueLink={this.linkState('newDescriptionText')}
                    className='form-control'/>
          </div>
          <div className='form-group col-xs-6'>
            <input type="submit" value="Add " className='btn btn-sm btn-default' />
          </div>
       </form>
      </div>
    </section>


  onNewTodoSubmit: (e) ->
    e.preventDefault()
    if (@state.newDescriptionText.trim())
      @getFlux().actions.todos.addTodo
        description: @state.newDescriptionText
      @setState newDescriptionText: ""

module.exports = ToDoListComponent
