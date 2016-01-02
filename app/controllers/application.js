import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  currentLanguage: Ember.computed('I18n.locale',function() {
    return I18n.locale;
  }),

  languages: Ember.computed(function() {
    return _.keys(I18n.translations);
  }),

  actions: {
    invalidateSession() {
      this.controllerFor('messages').send('loggingOut');

      var _this = this;
      setTimeout(function() {
        _this.get('session').invalidate();
      },4000);
    }
  }

});
