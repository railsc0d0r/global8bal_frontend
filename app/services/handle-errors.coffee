`import Ember from 'ember'`
`import _ from 'lodash/lodash'`

HandleErrorsService = Ember.Service.extend(
  joinErrorMessages: (errors) ->
    messages = _.pluck(errors, 'title')
    errorMessage = messages.join(", ")
    return errorMessage
)

`export default HandleErrorsService`
