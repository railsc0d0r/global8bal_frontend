`import Ember from 'ember'`

EmployeesRoute = Ember.Route.extend(
  renderTemplate: ->
        this.render(outlet: 'index')
)

`export default EmployeesRoute`
