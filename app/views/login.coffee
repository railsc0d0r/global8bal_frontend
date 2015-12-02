`import Ember from 'ember'`
LoginView = Ember.View.extend(
  didInsertElement: () ->
    element = $('#login_form')
    element.modal(
        backdrop: 'static',
        keyboard: false,
        show: true
    )

    controller = this.get('controller')

    if controller.get('errorMessage')
        controller.set('errorMessage', null) 
)

`export default LoginView`
