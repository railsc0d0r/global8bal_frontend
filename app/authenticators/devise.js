import DeviseAuthenticator from 'ember-simple-auth/authenticators/devise';

export default DeviseAuthenticator.extend({
  identificationAttributeName: 'login',
  serverTokenEndpoint: '/backend/users/sign_in'
});
