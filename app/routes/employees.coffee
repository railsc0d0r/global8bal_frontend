`import Ember from 'ember'`

EmployeesRoute = Ember.Route.extend(
  model: ->
        this.store.findAll('employee')
        
  renderTemplate: ->
        this.render(outlet: 'index')
)

`export default EmployeesRoute`
