`import Ember from 'ember'`
`import UnauthenticatedRouteMixin from 'ember-simple-auth/mixins/unauthenticated-route-mixin';`

LoginRoute = Ember.Route.extend(UnauthenticatedRouteMixin,
  renderTemplate: ->
        this.render('index',
          controller: 'index'
        )
        this.render('login',
          into: 'application'
          controller: 'login'
          outlet: 'modal'
        )
        return
)

`export default LoginRoute`
