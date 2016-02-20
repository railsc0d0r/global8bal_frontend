`import Ember from 'ember'`

SignupController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    signUpPlayer: () ->
        country = this.get('country.name') if this.get('country')

        attributes = {
                email: this.get('email'),
                firstname: this.get('firstname'),
                lastname: this.get('lastname'),
                street: this.get('street'),
                street2: this.get('street2'),
                zip: this.get('zip'),
                city: this.get('city'),
                country: country,
                card_number: this.get('card_number'),
                date_of_birth: this.get('date_of_birth')        
        }

        player = this.store.createRecord('player', attributes)
        that = this
        player.save().then(() ->
                that._close()
                that.transitionToRoute('index')
                console.log('Player created.')
                that.controllerFor('messages').send('successfullySignedUp', "Player '" + player.get('lastname') + ", " + player.get('firstname') + "'")
        ).catch((error) ->
                errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                that.set('errorMessage', errorMessage)
                console.log("Player couldn't be created:" + errorMessage)
                player.transitionTo('created.uncommitted')
                player.deleteRecord()
                return
        )

    close: () ->
        this._close()

  _close: () ->
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
            this.transitionToRoute('index')
)

`export default SignupController`
