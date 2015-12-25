import Ember from 'ember';

export default {
  name: "current-roles",

  initialize: function({ registry }) {
    const service = Ember.ArrayProxy.create({ isServiceFactory: true });
    registry.register('service:current-roles', service, { instantiate: false, singleton: true });
    registry.injection('route', 'currentRoles', 'service:current-roles');
    registry.injection('controller', 'currentRoles', 'service:current-roles');
    registry.injection('component', 'currentRoles', 'service:current-roles');
  }
};
