`import DS from 'ember-data'`

Section = DS.Model.extend {
  path: DS.attr('string'),
  background: DS.attr(),
  contents: DS.hasMany('content', async: true),

  currentContent: Ember.computed('I18n.locale', 'contents.@each.language', ->
          that = this
          this.get('contents').then((contents) ->
                                                obj = contents.findBy('language',I18n.locale)
                                                if typeof(obj) == 'undefined'
                                                  objName = I18n.t('activerecord.models.section', count: 1)
                                                  obj = that.store.createRecord('content', language: I18n.locale, content: I18n.t('content.not_translated', name: objName))
                                                  contents.pushObject(obj)
                )


          return this.get('contents').findBy('language',I18n.locale)
        )
}

`export default Section`
