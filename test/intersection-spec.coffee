# intersection-spec.coffee

assert = require 'assert'

Intersection = require '../lib/intersection'

describe 'Intersection', ()->
	describe 'rating', ()->
		it 'should return a rating', ()->
			newData = Intersection
				nRoads: 4
				nCrossWalks: 2

			newData.save().then (doc)->
				intersection = doc

				assert.equal 2, intersection.rating