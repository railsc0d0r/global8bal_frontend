import Ember from 'ember';

export default Ember.Controller.extend({
  needs: ['application'],
  authManager: Ember.inject.service('session'),

  actions: {
    authenticate() {
      let login = this.get('login');
      let password = this.get('password');

      this.get('authManager').authenticate('authenticator:devise', login, password).catch((reason) => {
        this.set('errorMessage', reason.error);
        this.set('login', '');
        this.set('password', '');
      });
    },
    close() {
      $('.modal').modal('hide');
      this.set('errorMessage', null)
      this.transitionToRoute('application');
    }
  }
});
