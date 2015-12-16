`import Ember from 'ember'`

EmployeesNewController = Ember.Controller.extend(
  roles: Ember.computed(() ->
        return this.store.findAll('role'))
  countries: Ember.computed(() ->
        return this.store.findAll('country'))

  actions:
    close: () ->
        $('.modal').modal('hide')
        this.transitionToRoute('employees')
)

`export default EmployeesNewController`
