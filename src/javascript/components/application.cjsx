# @cjsx React.DOM

React =     require("React")
Fluxxor =   require("fluxxor")
FluxMixin = Fluxxor.FluxMixin(React)
Application = React.createClass
  mixins: [FluxMixin]

  render: ->
    <section className="application-container">
    </section>

module.exports = Application
