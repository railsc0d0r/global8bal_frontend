`import Ember from 'ember'`

HandleErrorsService = Ember.Service.extend(
  joinErrorMessages: (errors) ->
    messages = _.pluck(errors, 'title')
    errorMessage = messages.join(", ")
    return errorMessage
)

`export default HandleErrorsService`
