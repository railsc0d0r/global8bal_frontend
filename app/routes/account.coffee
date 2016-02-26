`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

AccountRoute = Ember.Route.extend(AuthenticatedRouteMixin,
        model: ->
                currentUser = this.get('currentUser.content')

                objType = currentUser.get('auth_obj_type').toLowerCase()
                objId = currentUser.get('auth_obj_id')

                store = this.get('store')
                store.findRecord(objType, objId)
)

`export default AccountRoute`
