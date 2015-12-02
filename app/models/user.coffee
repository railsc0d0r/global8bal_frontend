`import DS from 'ember-data'`

User = DS.Model.extend {
      username: DS.attr('string'),
      email: DS.attr('string'),
      role_name: DS.attr('string')

      is_admin: Ember.computed('role_name', () ->
          return this.get('role_name') == 'Administrator'
        )
}

`export default User`
