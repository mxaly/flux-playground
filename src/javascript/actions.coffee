Const = require("./constants")
Actions =
  todos:
    toggleComplete: (todo) ->
      @dispatch Const.TODO_TOGGLE, todo: todo
    addTodo: (todo) ->
      @dispatch Const.TODO_ADD, todo: todo
    load: ->
      @dispatch Const.LOAD_TODOS
    search: (query) ->
      @dispatch Const.SEARCH_TODO, query: query
    removeTodo: (todo) ->
      @dispatch Const.REMOVE_TODO, todo: todo

module.exports = Actions
