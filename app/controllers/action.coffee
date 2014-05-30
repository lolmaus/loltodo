ActionController = Ember.ObjectController.extend

  # Actions
  actions:
    edit: ->
      @set 'isEditing', true

    finishEditing: ->
      bufferedTitle = @get('bufferedTitle').trim()

      if Ember.isEmpty bufferedTitle
        Ember.run.debounce this, 'remove', 0
#        @send 'remove'
      else
        action = @get('model')
        action.set 'title', bufferedTitle
        action.save()

      @set 'bufferedTitle', bufferedTitle # Persist trim
      @set 'isEditing', false

    remove: ->
      # Debounce calls a method, so we can't store the method in an action.
      # Thus, proxying the action to the method.
      @remove()

  # Properties

  isEditing: false
  bufferedTitle: Ember.computed.oneWay 'title'

  isCompleted: ((key, value) ->
    model = @get 'model'

    # Getter or setter?
    if value is undefined

      # The property is being used as a getter
      return model.get 'isCompleted'

    else

      # The property is being used as a setter
      model.set 'isCompleted', value
      model.save()
      return value

  ).property 'model.isCompleted'


  # Methods

  remove: ->
    action = @get 'model'
    action.deleteRecord()
    action.save()


`export default ActionController`