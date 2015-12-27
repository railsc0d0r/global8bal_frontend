`import DS from 'ember-data'`

Content = DS.Model.extend {
  headline: DS.attr('string'),
  content: DS.attr('string')
}

`export default Content`
