import DeviseAuthorizer from 'ember-simple-auth/authorizers/devise';

export default DeviseAuthorizer.extend({
  authorize(sessionData, block) {
    block('Auth-Token', sessionData.token);
    block('Auth-Login', sessionData.login);
  }
});
