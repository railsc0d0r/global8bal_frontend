`import Ember from 'ember'`

EmployeeDeleteRoute = Ember.Route.extend(
  errorHandler: Ember.inject.service('handle-errors')

  model: () -> this.modelFor('employee')
  afterModel: (employee,transition) ->
                that = this
                employee.deleteRecord()
                firstname = employee.get('firstname')
                lastname = employee.get('lastname')
                employee.save().then(() ->
                  that.controllerFor('messages').send('successfullyDeleted', "Employee '" + lastname + ", " + firstname + "'")
                  that.transitionTo('employees')
                ).catch((error) ->
                  errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                  that.controllerFor('messages').send('deleteFailed', errorMessage)
                  employee.rollbackAttributes()
                )
)

`export default EmployeeDeleteRoute`
