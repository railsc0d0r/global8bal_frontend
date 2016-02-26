`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

AccountRoute = Ember.Route.extend(AuthenticatedRouteMixin,
        model: ->
                currentUser = this.get('currentUser')
                console.log(JSON.stringify(currentUser))
)

`export default AccountRoute`
