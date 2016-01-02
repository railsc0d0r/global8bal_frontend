`import Ember from 'ember'`

ApplicationView = Ember.View.extend(
  rerenderApp: (->
        this.rerender()
  ).observes('I18n.locale')
)

`export default ApplicationView`
