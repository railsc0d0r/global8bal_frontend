`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

EmployeeRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: (params) ->
           return this.store.find('employee', params.employee_id)
)

`export default EmployeeRoute`
