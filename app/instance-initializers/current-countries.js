import Ember from 'ember';

export default {
  name: "current-countries",

  initialize: function({ registry }) {
    const service = Ember.ObjectProxy.create({ isServiceFactory: true });
    registry.register('service:current-countries', service, { instantiate: false, singleton: true });
    registry.injection('route', 'currentCountries', 'service:current-countries');
    registry.injection('controller', 'currentCountries', 'service:current-countries');
    registry.injection('component', 'currentCountries', 'service:current-countries');
  }
};
