`import Ember from 'ember'`

MessagesController = Ember.Controller.extend(
  actions:
    successfulAuthenticated: () ->
      this._showMessage("Successfully authenticated.")
    
    loggingOut: () ->
      this._showMessage("Logging out.")
    
    successfullyCreated: (object_name) ->
      this._showMessage(object_name + " successfully created.")
    
    successfullyUpdated: (object_name) ->
      this._showMessage(object_name + " successfully updated.")

    successfullyDeleted: (object_name) ->
      this._showMessage(object_name + " successfully deleted.")

    deleteFailed: (errorMessage) ->
      this._showError("Delete failed: " + errorMessage)

    showErrorMsg: (msg) ->
      this._showError("Error: " + msg)
    
  _showMessage: (message) ->
    div = "<div id='messagePopUp' class='message'>" + message + "</div>"
    this._showPopUp(div)
    
  _showError: (error) ->
    div = "<div id='messagePopUp' class='error'>" + error + "</div>"
    this._showPopUp(div)
    
  _showPopUp: (content) ->
    $('body').prepend(content)
    $('#messagePopUp').fadeOut(5000, () -> $('#messagePopUp').remove())
)

`export default MessagesController`
