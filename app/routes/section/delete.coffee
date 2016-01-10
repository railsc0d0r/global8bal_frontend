`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

SectionDeleteRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  errorHandler: Ember.inject.service('handle-errors')

  model: () -> this.modelFor('section')
  afterModel: (section,transition) ->
                that = this
                section.deleteRecord()
                path = section.get('path')
                section.save().then(() ->
                  that.controllerFor('messages').send('successfullyDeleted', "Section on '" + path + "'")
                  that.transitionTo(path)
                ).catch((error) ->
                  errorMessage = that.get('errorHandler').joinErrorMessages(error.errors)
                  that.controllerFor('messages').send('deleteFailed', errorMessage)
                  section.rollbackAttributes()
                )
)

`export default SectionDeleteRoute`
