`import Ember from 'ember'`

EmployeesNewController = Ember.Controller.extend(
  actions:
    close: () ->
        $('.modal').modal('hide')
        this.transitionToRoute('employees')
)

`export default EmployeesNewController`
