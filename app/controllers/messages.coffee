`import Ember from 'ember'`

MessagesController = Ember.Controller.extend(
  actions:
    successfulAuthenticated: () ->
      this._showMessage("Successfully authenticated.")
    
    loggingOut: () ->
      this._showMessage("Logging out.")
    
    
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
    $('#messagePopUp').fadeOut(2000, () -> $('#messagePopUp').remove())
)

`export default MessagesController`
