ActionsRoute = Ember.Route.extend
  model: ->
    @store.find 'action'

`export default ActionsRoute`