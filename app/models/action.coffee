Action = DS.Model.extend
  title: DS.attr 'string'
  isCompleted: DS.attr 'boolean'

Action.reopenClass
  FIXTURES: [
    id: 1
    title: 'Foo'
    isCompleted: true
  ,
    id: 2
    title: 'Bar'
    isCompleted: false
  ]

`export default Action`