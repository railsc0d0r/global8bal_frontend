`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

SectionEditRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: () -> this.modelFor('section')

  renderTemplate: ->
        this.render(
          into: 'application'
          outlet: 'index'
        )

)

`export default SectionEditRoute`
