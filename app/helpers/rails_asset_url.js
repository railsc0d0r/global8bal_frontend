import Ember from 'ember';

export default Ember.Helper.helper(function(params) {
  let file = params[0];
  return window.assets.images[file];
});
