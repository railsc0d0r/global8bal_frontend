`import DS from 'ember-data'`

Section = DS.Model.extend {
  path: DS.attr('string'),
  contents: DS.hasMany('content', async: true),

  currentContent: Ember.computed('I18n.locale', 'contents', ->
          _.findWhere(this.get('contents'), {'language': I18n.locale})
        )
}

`export default Section`
