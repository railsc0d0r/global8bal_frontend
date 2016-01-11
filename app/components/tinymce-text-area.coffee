`import Ember from 'ember'`

TinymceTextAreaComponent = Ember.TextArea.extend(
  editor: null,
  _suspendValueChange: false,
  didInsertElement: () ->
                      id = "#" + this.get("elementId")
                      view = this
                      tinymce.init(
                        selector: id,
                        setup : (ed) ->
                                  view.set("editor", ed)
                                  ed.on("keyup change", () ->
                                                          view.suspendValueChange(() ->
                                                                                    view.set("value", ed.getContent())
                                                                                    return)
                                                          return))
                      return
  ,
  suspendValueChange: (cb) ->
                        this._suspendValueChange = true
                        cb()
                        this._suspendValueChange = false
                        return
  ,
  valueChanged: (() ->
                   if (this._suspendValueChange) 
                     return
                   content = this.get("value")
                   this.get("editor").setContent(content)
                   return
  ).observes("value"),
  willClearRender: () -> 
                     this.get("editor").remove()
                     console.log("Editor removed")
                     return
  )

`export default TinymceTextAreaComponent`
