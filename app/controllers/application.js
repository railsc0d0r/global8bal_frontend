import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),
  intl: Ember.inject.service(),

  currentLanguage: Ember.computed('intl.locale', function() {
    return this.get('intl').get('locale').shift();
  }),

  languages: Ember.computed(function() {
    return this.get('intl').getLocalesByTranslations();
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
