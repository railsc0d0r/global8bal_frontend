`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

EmployeesRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: ->
        this.store.findAll('employee')
        
  renderTemplate: ->
        this.render(outlet: 'index')
)

`export default EmployeesRoute`
