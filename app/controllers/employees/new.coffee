`import Ember from 'ember'`

EmployeesNewController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  roles: Ember.computed(() ->
        return this.store.findAll('role'))
  countries: Ember.computed(() ->
        return this.store.findAll('country'))

  actions:
    createEmployee: () ->
        role_name = this.get('role.name') if this.get('role')
        password = this.get('password')
        password_confirmation = this.get('password_confirmation')
        firstname = this.get('firstname')
        lastname = this.get('lastname')
        email = this.get('email')
        street = this.get('street')
        street2 = this.get('street2')
        zip = this.get('zip')
        city = this.get('city')
        country = this.get('country.name') if this.get('country')

        attributes = { role_name: role_name, password: password, password_confirmation: password_confirmation, email: email, firstname: firstname, lastname: lastname, street: street, street2: street2, zip: zip, city: city, country: country }
        employee = this.store.createRecord('employee', attributes)
        self = this
        employee.save().then((newEmployee) ->
                self._close()
                self.transitionToRoute('employees')
                console.log('Employee created.')
                self.controllerFor('messages').send('successfullyCreated', "Employee '" + lastname + ", " + firstname + "'")
            ).catch((error) ->
                errorMessage = self.get('errorHandler').joinErrorMessages(error.errors)
                self.set('errorMessage', errorMessage)
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
