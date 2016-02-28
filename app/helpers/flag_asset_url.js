import Ember from 'ember';

export default Ember.Helper.helper(function(params) {
  let locale = params[0];
  const images = window.assets.images;
  const key = 'flags/' + locale + '.png';
  return images[key];
});
