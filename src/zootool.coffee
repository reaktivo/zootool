
request = require 'request'
UsersQuery = require './users_query'
ItemsQuery = require './items_query'


API_URL = "http://zootool.com/api/"

module.exports = class
  constructor: (@api_key) ->
    @users = new UsersQuery this
    @items = new ItemsQuery this
    
  item: (uid) ->
    @items.info uid
    this
    
  request: (path, callback) ->
    url = "#{API_URL}#{path}&apikey=#{@api_key}"
    request url, (error, res, body) ->
      if res.statusCode is not 200
        error = true
      callback error, JSON.parse(body)
    this