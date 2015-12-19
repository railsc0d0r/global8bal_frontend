`import Ember from 'ember'`

ModalDialogComponent = Ember.Component.extend(
  classNames: ['modal-dialog']

  didInsertElement: () ->
    element = $('.dialog')
    element.modal(
        backdrop: 'static',
        keyboard: false,
        show: true
    )

    controller = this.get('controller')

    if controller.get('errorMessage')
        controller.set('errorMessage', null) 

  actions:
    closeDialog: () ->
        this.sendAction('closeDialogAction')
)

`export default ModalDialogComponent`
