ActionsController = Ember.ArrayController.extend

  # Configuration

  itemController: 'action'



  # Actions

  actions:
    createTodo: ->

      # Get the action: title set by the "New action" text field
      title = @get 'newTitle'
      return if not title.trim()

      # Create a new Action model record
      action = @store.createRecord 'action',
        title: title
        isCompleted: false

      @set 'newTitle', ''
      action.save()

#    parseChangeNewActionInput: ->
#      text = @get('newTitle').trim()
#      isTextFull = text.length > 0
#      @set 'isNewActionInputFull', isTextFull
#
#    bar: ->
#      console.log 'BAAAARRRRRRRRRRRRRRRRRRRRRRRRRr'


  # Properties

  isNewActionInputFull: false

  total: (->
    @get 'length'
  ).property '@each'

  remaining: ( ->
    @filterBy 'isCompleted', false
      .get 'length'
  ).property '@each.isCompleted'

`export default ActionsController`