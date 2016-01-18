`import Ember from 'ember'`

SectionUploadBackgroundController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    fileLoaded: (file) ->
      this.set('file_name', file.filename)
      this.set('file_size', Math.round(file.size / 1024) + "Kb")
      this.set('background', file)

    uploadBackgroundImage: () ->
        section = this.get('model')
        background = this.get('background')

        if background
          section.set('background', background)
          that = this
          section.save().then(
            that._close()
            that.transitionToRoute(section.get('path'))
            console.log('Backgroundimage for section uploaded.')
            that.controllerFor('messages').send('successfullyUploaded', "Backgroundimage")
          ).catch((error) ->
                errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                that.set('errorMessage', errorMessage)
                console.log("Backgroundimage couldn't be uploaded:" + errorMessage)
                section.rollbackAttributes()
          )
        else
          this._close()

    close: () ->
        this._close()

  _close: () ->
      $('.modal').modal('hide')
      this.set('file_name', null)
      this.set('file_size', null)
      this.set('background', null)
      this.transitionToRoute(this.get('model.path'))
)

`export default SectionUploadBackgroundController`
