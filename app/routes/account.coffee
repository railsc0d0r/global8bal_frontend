`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

AccountRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: ->
        currentUser = this.get('currentUser.content')

        objType = currentUser.get('auth_obj_type').toLowerCase()
        objId = currentUser.get('auth_obj_id')

        this.set('objType', objType)

        store = this.get('store')
        return store.findRecord(objType, objId)

  renderTemplate: ->
        this.render('account_' + this.get('objType'),
          into: 'application'
          outlet: 'index'
        )

)

`export default AccountRoute`
