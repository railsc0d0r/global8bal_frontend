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

        section_attributes = {path: path}
        section = this.store.createRecord('section', section_attributes)

        section.get('contents').then((contents) -> contents.pushObject(contentObj))

        that = this
        section.save().then(() ->
                contentObj.save()
                that._close()
                that.transitionToRoute(path)
                console.log('Section created.')
                that.controllerFor('messages').send('successfullyCreated', "Section and content on '" + section.get('path') + "'")
        ).catch((error) ->
                console.log(error)
                errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                that.set('errorMessage', errorMessage)
                console.log("Section couldn't be created:" + errorMessage)
                contentObj.transitionTo('created.uncommitted')
                contentObj.deleteRecord()
                section.transitionTo('created.uncommitted')
                section.deleteRecord()
                return
        )

    close: () ->
        this._close()

  _close: () ->
            this.set('errorMessage', null)
            this.set('headline', '')
            this.set('content', '')

            this.transitionToRoute(this.get('path'))
)

`export default SectionsNewController`
