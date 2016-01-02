import Ember from 'ember';

export  function i18nT(property, options) {
  var params = options.hash,
      self = this;

  // Support variable interpolation for our string
  Object.keys(params).forEach(function (key) {
    params[key] = Em.Handlebars.get(self, params[key], options);
  });

  return I18n.t(property, params);
}

export default Ember.Handlebars.makeBoundHelper(i18nT);
