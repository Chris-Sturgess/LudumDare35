class Game

	@car
	@$gameBox

	constructor: ->
		@$gameBox = $('#gameBox')
		@car = new Character(@$gameBox, this)

	$: (s)->
		@$gameBox.find(s)


class Character

	CIRCLE: 'circle'
	TRIANGLE: 'triangle'
	SQUARE: 'square'

	TYPES: [@CIRCLE, @TRIANGLE, @SQUARE]

	POS: [150, 300, 450]

	myWidth: 30
	myHeight: 30
	myTop: 400
	
	@myPos
	@$me
	@type
	@myType

	#Initializers
	constructor: (@$gameBox, @parent) ->
		@$me = $('.character')
		@TYPES = [@CIRCLE, @TRIANGLE, @SQUARE]
		@initChar()
		@initKeys()

	initChar: ->
		@setType(2)
		@setLoc(0)

	initKeys: ->
		$(document).keyup(@checkKey)

	#Setters
	setLoc: (l) =>
		return if not (0 <= l <= 2)
		@myPos = l
		@$me.offset(
			left: @POS[l]
			top: @myTop
		)

	setType: (t) ->
		console.log(t)
		s = t
		s = 0 if s > 2
		s = 2 if s < 0
		console.log s
		@myType = s
		@type = @TYPES[s]
		console.log(@type)
		@$me.removeClass(@CIRCLE)
		@$me.removeClass(@SQUARE)
		@$me.removeClass(@TRIANGLE)
		@$me.addClass(@type)

	#Event Handlers

	checkKey: (e) =>
		key = e.which
		switch key
			when 37 then @setLoc(@myPos - 1)
			when 38 then @setType(@myType + 1)
			when 39 then @setLoc(@myPos + 1)
			when 40 then @setType(@myType - 1)

		e.preventDefault() if 37 <= e <= 40



$(document).ready(->
	window.game = new Game()
);