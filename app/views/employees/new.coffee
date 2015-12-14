`import Ember from 'ember'`

EmployeesNewView = Ember.View.extend(
  didInsertElement: () ->
    element = $('#new_employee_form')
    element.modal(
        backdrop: 'static',
        keyboard: false,
        show: true
    )

    controller = this.get('controller')

    if controller.get('errorMessage')
        controller.set('errorMessage', null) 
)

`export default EmployeesNewView`
