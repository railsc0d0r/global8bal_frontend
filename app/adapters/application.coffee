`import DS from 'ember-data'`
`import $ from 'jquery'`
`import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin';`

ApplicationAdapter = DS.RESTAdapter.extend(DataAdapterMixin,
  namespace: 'backend'
  headers: 
    "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
  authorizer: 'authorizer:devise'
)

`export default ApplicationAdapter`
