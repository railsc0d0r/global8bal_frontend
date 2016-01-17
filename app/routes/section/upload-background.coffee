`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

SectionUploadBackgroundRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: () -> this.modelFor('section')
)

`export default SectionUploadBackgroundRoute`
