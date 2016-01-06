`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

SectionsNewRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  renderTemplate: ->
                this.render(outlet: 'index', into: 'application')

  setupController: (controller, model) ->
        controller.set('path', this.get('context.path'))
)

`export default SectionsNewRoute`
