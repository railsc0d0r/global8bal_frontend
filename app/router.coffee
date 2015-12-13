`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map -> 

  @route 'login'
  @route 'signup'
  @route 'users', -> 
    @route 'new'
    return
  @resource 'user', path: 'users/:user_id', ->
    @route 'edit'
    @route 'delete'
    return
  return
  @resource 'employees', ->
    @route 'new'
    return
  @resource 'employee', path: 'employees/:employee_id', ->
    @route 'edit'
    @route 'delete'
    return

`export default Router`
