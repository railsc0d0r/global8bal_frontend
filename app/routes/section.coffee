`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';`

SectionRoute = Ember.Route.extend(AuthenticatedRouteMixin,
  model: (params) ->
           return this.store.find('section', params.section_id)
)

`export default SectionRoute`
