import Ember from 'ember';

export function railsAssetUrl(file) {
  return window.assets.images[file];
}

export default Ember.Handlebars.makeBoundHelper(railsAssetUrl);
