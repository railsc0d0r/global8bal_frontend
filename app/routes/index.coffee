`import Ember from 'ember'`

IndexRoute = Ember.Route.extend(
  model: ->
        this.store.query('section', {path: this.routeName})

  setupController: (controller, model) ->
        controller.set('currentPath', this.routeName)

  renderTemplate: ->
        this.render(outlet: 'index')
)

`export default IndexRoute`
