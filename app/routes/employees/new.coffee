`import Ember from 'ember'`

EmployeesNewRoute = Ember.Route.extend(
  model: -> this.store.findAll('role')
)

`export default EmployeesNewRoute`
