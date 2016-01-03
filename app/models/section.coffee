`import DS from 'ember-data'`

Section = DS.Model.extend {
  path: DS.attr('string'),
  contents: DS.hasMany('content', async: true)
}

`export default Section`
