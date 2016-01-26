`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map -> 

  @resource 'sections', ->
    @route 'new', path: 'sections/new/:path'
    return
  @resource 'section', path: 'sections/:section_id', ->
    @route 'upload-background'
    @route 'edit'
    @route 'delete'
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
  @route 'faq'
  @route 'about_us'
  @route 'the_game'
  @route 'terms_of_use'
  @route 'rules'
  return

`export default Router`
