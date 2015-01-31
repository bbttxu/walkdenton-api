# intersection.coffee

thinky = require('thinky')()
type = thinky.type

Intersection = thinky.createModel "Intersection",
	id: String
	coordinates: "Point"
	nRoads: type.number().integer()
	nCrosswalks: type.number().integer()

module.exports = Intersection