`import DS from 'ember-data'`

Language = DS.Model.extend {
  name: DS.attr('string'),
  native_name: DS.attr('string'),
  i18n_code: DS.attr('string')
}

`export default Language`
