`import Ember from 'ember'`

SectionUploadBackgroundController = Ember.Controller.extend(
  actions:
    fileLoaded: (file) ->
      this.set('file_name', file.filename)
      this.set('file_size', Math.round(file.size / 1024) + "Kb")
      this.set('background', file)

    uploadBackgroundImage: () ->
        return
)

`export default SectionUploadBackgroundController`
