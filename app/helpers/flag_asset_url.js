import Ember from 'ember';

export function flagAssetUrl(locale) {
  const images = window.assets.images;
  const key = 'flags/' + locale + '.png';
  return images[key];
}

export default Ember.Handlebars.makeBoundHelper(flagAssetUrl);
