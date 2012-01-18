module.exports = class
  constructor: (@api) ->
  
  get_uri: (method, args) ->
    if args
      args = @build_query_string args
    else
      args = ""
    "#{@prefix}/#{method}/?#{args}"  
  
  build_query_string: (obj) ->
    str = []
    for key, value of obj
      value = encodeURIComponent value
      str.push "#{key}=#{value}"
    str.join "&"