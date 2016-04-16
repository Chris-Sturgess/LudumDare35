class Game

	@car
	@$gameBox

	constructor: ->
		@$gameBox = $('#gameBox')
		@car = new Character()

	$: (s)->
		@$gameBox.find(s)


class Character

	CIRCLE: 'circle'
	TRIANGLE: 'triangle'
	SQUARE: 'square'

	POS: [150, 300, 450]

	myWidth: 30
	myHeight: 30
	myTop: 400
	
	@myPos
	@$me
	@type

	constructor: ->
		@$me = $('.character')
		@initChar()

	initChar: ->
		@setType(@SQUARE)
		@setLoc(0)

	setLoc: (l) =>
		@myPos = l
		@$me.offset(
			left: @POS[l]
			top: @myTop
		)

	setType: (type) ->
		@$me.removeClass(@CIRCLE)
		@$me.removeClass(@SQUARE)
		@$me.removeClass(@TRIANGLE)
		@type = type
		@$me.addClass(@type)















$(document).ready(->
	window.game = new Game()
);