`import DS from 'ember-data'`

Content = DS.Model.extend {
  headline: DS.attr('string'),
  content: DS.attr('string'),
  language: DS.attr('string'),
  section: DS.belongsTo('section')
}

`export default Content`
