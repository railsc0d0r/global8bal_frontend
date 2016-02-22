`import Ember from 'ember'`

ConfirmationController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    confirm: () ->
        that = this
        confirmation_token = this.get('model.confirmation_token')
        password = this.get('password')
        password_confirmation = this.get('password_confirmation')

        Ember.$.ajax(
                      method: "PATCH",
                      url: "/backend/users/confirmation",
                      data: { confirmation_token: confirmation_token, user: {password: password, password_confirmation: password_confirmation} },
                      dataType: 'json'
                    ).done(() ->
                                        that._close()
                                        that.transitionToRoute('index')
                                        console.log('Account confirmed.')
                                        that.controllerFor('messages').send('successfullyConfirmed')
                    ).fail((xhr, status, error) ->
                                        errorMessage = that.get('errorHandler').joinErrorMessages(xhr.responseJSON.errors)
                                        that.set('errorMessage', errorMessage)
                                        console.log("User couldn't be confirmed: " + errorMessage)
                    )
    close: () ->
        this._close()

  _close: () ->
            this.set('password', null)
            this.set('password_confirmation', null)
            this.set('errorMessage', null)
            $('.modal').modal('hide')
            this.transitionToRoute('index')
)

`export default ConfirmationController`
