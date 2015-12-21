`import Ember from 'ember'`

EmployeeEditRoute = Ember.Route.extend(
  model: () -> this.modelFor('employee')
)

`export default EmployeeEditRoute`
