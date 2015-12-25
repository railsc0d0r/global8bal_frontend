`import Ember from 'ember'`

EmployeeEditController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    updateEmployee: () ->
        employee = this.get('model')
        employee.set('role_name', this.get('role.name'))
        employee.set('country', this.get('country.name'))

        that = this
        employee.save().then(() ->
                that._close()
                that.transitionToRoute('employees')
                console.log('Employee updated.')
                that.controllerFor('messages').send('successfullyUpdated', "Employee '" + employee.get('lastname') + ", " + employee.get('firstname') + "'")
        ).catch((error) ->
                errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                that.set('errorMessage', errorMessage)
                console.log("Employee couldn't be updated:" + errorMessage)
                employee.rollbackAttributes()
        )
        return

    close: () ->
        this._close()

  _close: () ->
      $('.modal').modal('hide')
      this.transitionToRoute('employees')
)

`export default EmployeeEditController`
