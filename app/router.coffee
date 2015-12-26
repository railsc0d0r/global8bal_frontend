`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map -> 

  @resource 'sections', ->
    @route('new')
    return
  @resource 'section', path: 'sections/:section_id', ->
    @route('edit')
    @route('delete')
    return
  @route 'login'
  @route 'signup'
  @route 'users', -> 
    @route 'new'
    return
  @resource 'user', path: 'users/:user_id', ->
    @route 'edit'
    @route 'delete'
    return
  @route 'employees', ->
    @route 'new'
    @resource 'employee', path: ':employee_id', ->
      @route 'edit'
      @route 'delete'
    return
  @route 'faq', ->
    @resource 'sections', ->
      @route('new')
      return
    @resource 'section', path: 'sections/:section_id', ->
      @route('edit')
      @route('delete')
      return
  return

`export default Router`
