import Ember from 'ember';

export  function i18nT(property, options) {
  let params = options.hash,
      self = this;

  return I18n.t(property, params);
}

export default Ember.Handlebars.makeBoundHelper(i18nT);
