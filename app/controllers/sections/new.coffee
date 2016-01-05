`import Ember from 'ember'`

SectionsNewController = Ember.Controller.extend(
  errorHandler: Ember.inject.service('handle-errors')

  actions:
    createSection: () ->
        path = this.get('path')

        headline = this.get('headline')
        content = this.get('content')
        language = I18n.locale

        content_attributes = {headline: headline, content: content, language: language}
        contentObj = this.store.createRecord('content', content_attributes)

        section_attributes = {path: path, contents: [contentObj]}
        section = this.store.createRecord('section', section_attributes)

        that = this
        section.save().then(() ->
                that._close()
                that.transitionToRoute(path)
                console.log('Section created.')
                that.controllerFor('messages').send('successfullyCreated', "Section on '" + section.get('path') + "'")
        ).catch((error) ->
                errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                that.set('errorMessage', errorMessage)
                console.log("Section couldn't be created:" + errorMessage)
                content.transitionTo('created.uncommitted')
                content.deleteRecord()
                section.transitionTo('created.uncommitted')
                section.deleteRecord()
                return
        )

    close: () ->
        this._close()

  _close: () ->
            this.set('headline', null)
            this.set('content', null)
            this.set('language', null)
            this.set('errorMessage', null)

            this.transitionToRoute(path)
)

`export default SectionsNewController`
