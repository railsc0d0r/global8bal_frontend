`import Ember from 'ember'`

TermsOfUseRoute = Ember.Route.extend(
  model: ->
        this.store.query('section', {path: this.routeName})

  setupController: (controller, model) ->
        controller.set('currentPath', this.routeName)
        controller.set('model', model)

  renderTemplate: ->
        this.render('content', {
          outlet: 'index'
        })
)

`export default TermsOfUseRoute`
