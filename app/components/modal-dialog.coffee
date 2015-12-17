`import Ember from 'ember'`

ModalDialogComponent = Ember.Component.extend(
  classNames: ['modal-dialog']

  actions:
    closeDialog: () ->
        this.sendAction('closeDialogAction')
)

`export default ModalDialogComponent`
