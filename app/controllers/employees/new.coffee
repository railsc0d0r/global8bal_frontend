`import Ember from 'ember'`

EmployeesNewController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    createEmployee: () ->
        role_name = this.get('role.name') if this.get('role')
        country = this.get('country.name') if this.get('country')

        attributes = {
                role_name: role_name,
                password: this.get('password'),
                password_confirmation: this.get('password_confirmation'),
                email: this.get('email'),
                firstname: this.get('firstname'),
                lastname: this.get('lastname'),
                street: this.get('street'),
                street2: this.get('street2'),
                zip: this.get('zip'),
                city: this.get('city'),
                country: country
        }

        employee = this.store.createRecord('employee', attributes)
        that = this
        employee.save().then(() ->
                that._close()
                that.transitionToRoute('employees')
                console.log('Employee created.')
                that.controllerFor('messages').send('successfullyCreated', "Employee '" + employee.get('lastname') + ", " + employee.get('firstname') + "'")
            ).catch((error) ->
                errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                that.set('errorMessage', errorMessage)
                console.log("Employee couldn't be created:" + errorMessage)
                employee.transitionTo('created.uncommitted')
                employee.deleteRecord()
                return
            )

    close: () ->
        this._close()

  _close: () ->
            this.set('role', null)
            this.set('password', null)
            this.set('password_confirmation', null)
            this.set('email', null)
            this.set('firstname', null)
            this.set('lastname', null)
            this.set('street', null)
            this.set('street2', null)
            this.set('zip', null)
            this.set('city', null)
            this.set('country', null)
            this.set('errorMessage', null)
            $('.modal').modal('hide')
            this.transitionToRoute('employees')
)

`export default EmployeesNewController`
