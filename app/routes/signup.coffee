`import Ember from 'ember'`
`import UnauthenticatedRouteMixin from 'ember-simple-auth/mixins/unauthenticated-route-mixin';`

SignupRoute = Ember.Route.extend(UnauthenticatedRouteMixin,
  renderTemplate: ->
        this.render('index'
          into: 'application'
          outlet: 'index'
        )
        this.render('signup',
          into: 'application'
          outlet: 'modal'
        )
        return
)

`export default SignupRoute`
