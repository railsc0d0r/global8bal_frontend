`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

UsersRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: () -> this.store.findAll('user')
  renderTemplate: () ->
        this.render('users',
          into: 'application'
        )
        return
)

`export default UsersRoute`
