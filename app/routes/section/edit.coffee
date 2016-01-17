`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

SectionEditRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: () -> this.modelFor('section')
)

`export default SectionEditRoute`
