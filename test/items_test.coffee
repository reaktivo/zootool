vows = require 'vows'
assert = require 'assert'
Zootool = require '../lib/zootool'
zoo = new Zootool process.env.API_KEY


validate_item  = (item) ->
  ['uid', 'type', 'permalink'].forEach (field) ->
    assert.include item, field
  

popular_method = (method) ->
  topic: -> 
    zoo.items.popular[method](@callback)
    return
  'is array':             (err, items) -> assert.isArray(items)
  'has length > 0':       (err, items) -> assert.isTrue(items.length > 0) 
  'contains valid items': (err, items) -> items.forEach validate_item
        

vows
  .describe('Items')
  .addBatch
    'Popular All': popular_method 'all'
    'Popular Month': popular_method 'month'
    'Popular Week': popular_method 'week'
    'Popular Today': popular_method 'today'
    'Item info': 
      topic: ->
        zoo.items.popular.today (err, items) =>
          zoo.items.info items[0].uid, (err, item) =>
            @callback(item, items[0])
        return
      'returns correct item': (item, other_item) ->
        assert.isTrue(true)
      'is valid item': (item, other_item) ->
        validate_item item

  .export(module)