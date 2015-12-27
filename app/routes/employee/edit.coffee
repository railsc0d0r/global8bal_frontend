`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

EmployeeEditRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: () -> this.modelFor('employee')
)

`export default EmployeeEditRoute`
