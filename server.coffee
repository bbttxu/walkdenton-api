# r = require 'rethinkdb'

thinky = require('thinky')()

Intersection = require './lib/intersection'

minLat = 33
maxLat = 34
minLng = -100
maxLng = -99


randomIn = (first, second)->
  min = Math.min first, second
  max = Math.max first, second
  val = ((100.0 * Math.random() * (max - min))/100) + min
  val

intersection = Intersection.save
  coordinates: [randomIn(maxLng, minLng), randomIn(maxLat, minLat)]
  nRoads: Math.floor randomIn 1, 4
  nCrosswalks: Math.floor randomIn 1, 4


restify = require 'restify'

server = restify.createServer
  name: 'walkdenton-api'

server.use()

server.get '/intersections', (req, res, next)->
  query = new thinky.Query(Intersection)
  query.run().then (val)->
    res.send val
    next()

server.get '/intersections/:id', (req, res, next)->
  id = req.params.id

  query = new thinky.Query(Intersection)
  query.get(id).run().then (val)->
    res.send val
    next()


server.post '/intersections', (req, res, next)->
  query = new thinky.Query(Intersection)
  query.run().then (val)->
    res.send val
    next()


server.listen 8000
