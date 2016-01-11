`import Ember from 'ember'`

SectionEditController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    updateSection: () ->
        contentObj = this.get('model.currentContent')

        that = this
        contentObj.save().then(() ->
          that._close()
          that.transitionToRoute(section.get('path'))
          console.log('Content for section updated.')
          that.controllerFor('messages').send('successfullyUpdated', "Content on '" + section.get('path') + "'")
        ).catch(() ->
          errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
          that.set('errorMessage', errorMessage)
          console.log("Content for section couldn't be updated:" + errorMessage)
          contentObj.rollbackAttributes()
        )
    close: () ->
        this._close()

  _close: () ->
      this.transitionToRoute(this.get('model.path'))
)

`export default SectionEditController`
