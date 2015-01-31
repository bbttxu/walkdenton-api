# intersection.coffee

thinky = require('thinky')()
type = thinky.type

Intersection = thinky.createModel "Intersection",
	id: String
	coordinates: "Point"
	nRoads: type.number().integer()
	nCrosswalks: type.number().integer()
	rating:
		_type: 'virtual'
		default: ()->
			this.nRoads - this.nCrossWalks

module.exports = Intersection