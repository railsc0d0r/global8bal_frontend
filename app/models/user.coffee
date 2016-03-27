`import DS from 'ember-data'`

User = DS.Model.extend {
      username: DS.attr('string')
      email: DS.attr('string')
      role_name: DS.attr('string')
      auth_obj_type: DS.attr('string')
      auth_obj_id: DS.attr('number')

      is_editor: Ember.computed('role_name', () ->
          return this.get('role_name') == 'Editor' || this.get('role_name') == 'Administrator'
        )
      is_admin: Ember.computed('role_name', () ->
          return this.get('role_name') == 'Administrator'
        )

      auth_obj: Ember.computed('auth_obj_type', 'auth_obj_id', () ->
          obj_type = this.get('auth_obj_type')
          obj_id = this.get('auth_obj_id')
          return this.get('store').findRecord(obj_type, obj_id)
        )
}

`export default User`
