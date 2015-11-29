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
  @ressource 'user', path: 'users/:user_id', ->
    @route 'edit'
    @route 'delete'
    return
  return

`export default Router`
