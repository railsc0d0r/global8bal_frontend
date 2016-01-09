`import DS from 'ember-data'`

Section = DS.Model.extend {
  path: DS.attr('string'),
  contents: DS.hasMany('content', async: true),

  currentContent: Ember.computed('I18n.locale', 'contents.@each.language', ->
          content = this.get('contents').findBy('language',I18n.locale)

          if typeof(content) == 'undefined'
            objName = I18n.t('activerecord.models.section', count: 1)
            console.log(objName)
            content = this.store.createRecord('content', language: I18n.locale, content: I18n.t('content.not_translated', name: objName))
            this.get('contents').then((contents) -> contents.pushObject(content))

          return content
        )
}

`export default Section`
