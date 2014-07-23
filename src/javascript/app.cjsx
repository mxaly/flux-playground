# @cjsx React.DOM

Fluxxor = require 'fluxxor'
React = require 'React'

actions = require './actions'
stores = require './stores'

Application = require './components/application'
flux = new Fluxxor.Flux(stores, actions)

React.renderComponent(<Application flux={flux} />, document.getElementById("app"))
