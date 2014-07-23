# @cjsx React.DOM

React =     require("React")
Fluxxor =   require("fluxxor")
FluxMixin = Fluxxor.FluxMixin(React)

ToDoListComponent = require "./todo_list"
Search = require "./search"

Application = React.createClass
  mixins: [FluxMixin]

  render: ->
    <section className="application-container">
      <div className="container todos-container">
        <Search />
        <ToDoListComponent />
      </div>
    </section>

module.exports = Application
