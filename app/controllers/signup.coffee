`import Ember from 'ember'`

SignupController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  idTypes: Ember.computed('I18n.locale', ->
          [
            I18n.t('signup.passport')
            I18n.t('signup.id-card')
          ]
        )

  endDate: Ember.computed(() ->
          endDate = new Date()
          endDate.setFullYear(endDate.getFullYear()-18)
          return endDate
        )

  defaultViewDate: Ember.computed(() ->
          now = new Date()
          defaultViewDate = {
                  year: now.getFullYear() - 18
                  month: now.getMonth()
                  day: now.getDate()
                }
        )

  acceptedTermsOfUse: false

  readPrivacyPolicy: false

  readRules: false

  isDisabled: Ember.computed('acceptedTermsOfUse', 'readPrivacyPolicy', 'readRules', () ->
          !(this.get('acceptedTermsOfUse') and this.get('readPrivacyPolicy') and this.get('readRules'))
        )

  actions:
    signUpPlayer: () ->
        country = this.get('country.name') if this.get('country')
        date_of_birth = this.get('date_of_birth')
        date_of_birth.setTime( date_of_birth.getTime() - new Date().getTimezoneOffset()*60*1000 )

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
                date_of_birth: date_of_birth
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
            this.set('date_of_birth', null)
            this.set('errorMessage', null)
            this.set('acceptedTermsOfUse', false)
            this.set('readPrivacyPolicy', false)
            this.set('readRules', false)
            $('.modal').modal('hide')
            this.transitionToRoute('index')
)

`export default SignupController`
