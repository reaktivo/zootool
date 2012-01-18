
users_methods = ["items", "info", "friends", "followers", "profiles"]

module.exports = class extends require('./zoo_query')
  
  prefix: 'users'
  
  constructor: (@api) ->
    users_methods.forEach (method) =>
      this[method] = (args = {}, callback) =>
        unless callback
          callback = args
          args = null
        @api.request @get_uri(method, args), callback
        this
      
  validate: ->
    false
    this