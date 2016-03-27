`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

AccountRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: ->
        user_id = this.get('session.session.content.authenticated.user_id')
        that = this
        this.get('store').findRecord('user', user_id).then( (currentUser) ->
                objType = currentUser.get('auth_obj_type').toLowerCase()
                that.set('objType', objType)

                return currentUser.get('auth_obj')
        )

  renderTemplate: ->
        this.render('account_' + this.get('objType'),
          into: 'application'
          outlet: 'index'
        )

)

`export default AccountRoute`
