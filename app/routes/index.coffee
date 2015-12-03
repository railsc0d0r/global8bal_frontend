`import Ember from 'ember'`

IndexRoute = Ember.Route.extend(
  renderTemplate: ->
        this.render(outlet: 'index')
)

`export default IndexRoute`
