`import DS from 'ember-data'`

Player = DS.Model.extend {
      firstname: DS.attr('string')
      lastname: DS.attr('string')
      nickname: DS.attr('string')
      title: DS.attr('string')
      email: DS.attr('string')
      phone: DS.attr('string')
      date_of_birth: DS.attr('date')
      street: DS.attr('string')
      street2: DS.attr('string')
      zip: DS.attr('string')
      city: DS.attr('string')
      region: DS.attr('string')
      country: DS.attr('string')
      username: DS.attr('string')
      card_number: DS.attr('string')
}

`export default Player`
