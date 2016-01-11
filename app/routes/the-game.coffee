`import Ember from 'ember'`

TheGameRoute = Ember.Route.extend(
  model: ->
        this.store.query('section', {path: this.routeName})

  setupController: (controller, model) ->
        controller.set('currentPath', this.routeName)
        controller.set('model', model)

  renderTemplate: ->
        this.render(outlet: 'index')
)

`export default TheGameRoute`
