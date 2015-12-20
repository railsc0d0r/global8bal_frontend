import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    invalidateSession() {
      this.controllerFor('messages').send('loggingOut');

      var _this = this;
      setTimeout(function(){
        _this.get('session').invalidate();
      },4000);
    }
  }

});
