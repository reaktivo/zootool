vows = require 'vows'
assert = require 'assert'
Zootool = require '../lib/zootool'
zoo = new Zootool process.env.API_KEY

vows
  .describe('User')
  .addBatch

    'List of items':
      topic: ->
        zoo.users.items(@callback)
        return
      'is Array': (err, body) ->
        assert.isArray(body)
      'has length > 0': (err, body) ->
        assert.isTrue(body.length > 0) 
      'contains valid items': (err, body) ->
        body.forEach (item) ->
          assert.include(item, 'uid')
          assert.include(item, 'type')
          assert.include(item, 'permalink')
    
    'User info': 
      topic: ->
        zoo.users.info({username: 'reaktivo'}, @callback)
        # zoo.users.friends({username: 'reaktivo'}, console.log)
        # zoo.users.followers({username: 'reaktivo'}, console.log)
        # zoo.users.profiles({username: 'reaktivo'}, console.log)
        return
      'is valid response': (err, body) ->
        assert.include(body, 'name')
        assert.include(body, 'profile')
        assert.include(body, 'entries')
      'is correct username': (err, body) ->
        assert.equal(body.username, 'reaktivo')
        
  .export(module)