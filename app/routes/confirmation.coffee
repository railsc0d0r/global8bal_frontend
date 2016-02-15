`import Ember from 'ember'`
`import UnauthenticatedRouteMixin from 'ember-simple-auth/mixins/unauthenticated-route-mixin';`

ConfirmationRoute = Ember.Route.extend(UnauthenticatedRouteMixin,
  renderTemplate: ->
        this.render('index'
          into: 'application'
          outlet: 'index'
        )
        this.render('confirmation',
          into: 'application'
          outlet: 'modal'
        )
        return
)

`export default ConfirmationRoute`
