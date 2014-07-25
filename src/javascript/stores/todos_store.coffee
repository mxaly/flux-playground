Fluxxor = require("fluxxor")
Const = require("../constants")
_ = require("Underscore")
Fuse = require("fuse.js")
Faker = require('faker-js')

TodosStore = Fluxxor.createStore
  initialize: (options) ->
    @todos =  []
    @searchQuery = ""
    @searchResult = null

    @bindActions(
      Const.TODO_TOGGLE, @onToggleTodo,
      Const.TODO_ADD, @onAddTodo,
      Const.LOAD_TODOS, @onLoadTodos,
      Const.SEARCH_TODO, @onSearchTodo
      Const.REMOVE_TODO, @onRemoveTodo
    )

  getTodos: ->
    @searchResult || @todos

  onSearchTodo: (peyload) ->
    { query } = peyload
    @searchQuery = query || ""

    if query
      searchOptions =
        keys: ['description']
      fuse = new Fuse(@todos, searchOptions)
      @searchResult = fuse.search(query)
    else
      @searchResult = null
    @emit("change")

  onToggleTodo: (peyload) ->
    { todo } = peyload
    todo.done = !todo.done
    @emit("change")

  getState: ->
    collection: @getTodos()
    query: @searchQuery

  onAddTodo: (payload) ->
    @todos.push payload.todo
    @emit 'change'

  onRemoveTodo: (todo) ->
    whereIsThatBitch = _.indexOf @todos, todo
    @todos.splice(whereIsThatBitch, whereIsThatBitch+1)

  onLoadTodos: ->
    @todos = _([0..25]).map (i) ->
      description: Faker.Lorem.sentence()
      done: false
    @emit 'change'
#    @done_rand()


  done_rand: ->
    el = Faker.random.array_element(@todos)
    el.done = !el.done
    @emit 'change'
    setTimeout(@done_rand, 1)


module.exports = TodosStore
