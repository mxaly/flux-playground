# @cjsx React.DOM

React =           require("React")
Fluxxor =         require("fluxxor")
FluxChildMixin =  Fluxxor.FluxChildMixin(React)


ToDoItemComponent = React.createClass
  mixins: [FluxChildMixin]

  propTypes: {
    todo: React.PropTypes.object.isRequired
  },

  render: ->
    <div onClick={@toggleComplete} className={ if @props.todo.done then "row done" else "row"}>
      <span> {@props.todo.description} </span>
      {if @props.todo.done then <img src="build/images/ok_icon.png", className="ok_img"/> }
      <div className="removeToDo" onClick={@removeTodo}>X</div>
    </div>

  toggleComplete: (e) ->
    @getFlux().actions.todos.toggleComplete(@props.todo)

  removeTodo: (e) ->
    @getFlux().actions.todos.removeTodo(@props.todo)

module.exports = ToDoItemComponent
