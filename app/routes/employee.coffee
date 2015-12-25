`import Ember from 'ember'`

EmployeeRoute = Ember.Route.extend(
  model: (params) ->
           return this.store.find('employee', params.employee_id)
)

`export default EmployeeRoute`
