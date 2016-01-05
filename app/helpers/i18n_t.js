import Ember from 'ember';

export default Ember.Helper.extend({
  onLocaleChange: Ember.observer('I18n.locale', function() {
                    this.recompute();
                  }),
  compute(params, hash) {
    return I18n.t(params[0], hash);
  }
});
