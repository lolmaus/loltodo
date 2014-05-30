var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
  this.resource('actions', { path: '/' });
});

export default Router;
