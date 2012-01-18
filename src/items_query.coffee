
popular_methods = ['all', 'month', 'week', 'today']

module.exports = class extends require('./zoo_query')
  
  prefix: 'items'
  
  constructor: (@api) ->
    @popular = {}
    popular_methods.forEach (method) =>
      @popular[method] = (callback) =>
        @api.request @get_uri("popular", method), callback
        this
  
  info: (uid, callback) ->
    if typeof uid is 'string'
      args = {uid}
    @api.request @get_uri("info", args), callback