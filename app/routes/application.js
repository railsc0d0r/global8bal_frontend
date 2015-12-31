import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';
import Settings from 'frontend/models/local-settings';

export default Ember.Route.extend(ApplicationRouteMixin,{
  intl: Ember.inject.service(),
  localSettings: Settings.create(),

  init: function() {
    const _this = this;

    this._populateCurrentCountries();

    this.get('session').on('authenticationSucceeded', function() {
      _this._populateCurrentUser();
      _this._populateCurrentRoles();
      _this._cleanUpAndTransition();
      _this.refresh();
    });

    this._super.apply(this, arguments);
  },

  beforeModel() {
    let intl = this.get('intl');
    let currentLocale = this.get('localSettings.locale');

    if (currentLocale) {
      intl.setLocale(currentLocale);
    } else {
      intl.setLocale('en');
    }
  },

  afterModel() {
    let session = this.get('session');

    if (session.get('isAuthenticated')) {
      this._populateCurrentUser();
      this._populateCurrentRoles();
    }
  },

  actions: {
    setLocale(locale) {
      let intl = this.get('intl');
      let localSettings = this.get('localSettings');
      intl.setLocale(locale);
      localSettings.set('locale', locale);
    }
  },

  _cleanUpAndTransition() {
    $('.modal').modal('hide');
    this.transitionTo('application');
    this.controllerFor('messages').send('successfulAuthenticated');
  },

  _populateCurrentRoles() {
    return this.store.findAll('role').then(roles => this.get('currentRoles').set('content', roles) && roles);
  },

  _populateCurrentCountries() {
    return this.store.findAll('country').then(countries => this.get('currentCountries').set('content', countries) && countries);
  },

  _populateCurrentUser() {
    const user_id = this._getUserIdFromSession();
    return this.store.find('user', user_id).then(user => this.get('currentUser').set('content', user) && user);
  },

  _getUserIdFromSession() {
    const user_id = this.get('session.session.content.authenticated.user_id');
    return user_id;
  }

});
