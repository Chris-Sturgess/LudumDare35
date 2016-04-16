class Game

	CIRCLE: 'circle'
	TRIANGLE: 'triangle'
	SQUARE: 'square'

	car: null
	$gameBox: null
	timer: null
	timeInterval: 5000

	constructor: ->
		@initGame()

	$: (s)->
		@$gameBox.find(s)

	initGame: ->
		@$gameBox = $('#gameBox')
		@car = new Character(@$gameBox, this)
		@timeInterval = 5000
		@enemies = []
		@initTimer()

	initTimer: ->
		@timer = setTimeout(@generateEnemy, 1000)

	generateEnemy: =>
		@enemies.push(new Enemy(@$gameBox, 1, @CIRCLE, @TRIANGLE, @SQUARE))
		@timer = setTimeout(@generateEnemy, @timeInterval)
		@timeInterval = @timeInterval * 0.99

class Character

	CIRCLE: 'circle'
	TRIANGLE: 'triangle'
	SQUARE: 'square'

	TYPES: [@CIRCLE, @TRIANGLE, @SQUARE]

	POS: [150, 300, 450]

	PRESSED: 
		37: false
		38: false
		39: false
		40: false

	myWidth: 30
	myHeight: 30
	myTop: 400
	
	myPos: 0
	$me: null
	type: null
	myType: null

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
		$(document).keydown(@checkKey)
		$(document).keyup(@clearUp)

	#Setters
	setLoc: (l) =>
		return if not (0 <= l <= 2)
		@myPos = l
		@$me.css('left', @POS[l])
		@$me.css('top', @myTop)

	setType: (t) ->
		console.log(t)
		s = t
		s = 0 if s > 2
		s = 2 if s < 0
		@myType = s
		@type = @TYPES[s]
		@$me.removeClass(@CIRCLE)
		@$me.removeClass(@SQUARE)
		@$me.removeClass(@TRIANGLE)
		@$me.addClass(@type)

	#Event Handlers

	checkKey: (e) =>
		key = e.which
		switch key
			when 37 then @setLoc(@myPos - 1) if not @PRESSED[37]
			when 38 then @setType(@myType + 1) if not @PRESSED[38]
			when 39 then @setLoc(@myPos + 1) if not @PRESSED[39]
			when 40 then @setType(@myType - 1) if not @PRESSED[40]

		if 37 <= key <= 40
			e.preventDefault() 
			@PRESSED[key] = true

	clearUp: (e) =>
		@PRESSED[e.which] = false if @PRESSED[e.which]

class Enemy

	CIRCLE: 'circle'
	TRIANGLE: 'triangle'
	SQUARE: 'square'

	POS: [150, 300, 450]

	constructor: (@$gameBox, @speed, @val1, @val2, @val3) ->
		@createEnemyDiv()

	createEnemyDiv: () ->
		console.log(@$gameBox)
		@$me = $('<div class="enemy">')
		@$me.css('top', 0)
		@createEnemyHoles()
		@$gameBox.append(@$me)

	createEnemyHoles: () ->
		@$me.append(@createEnemyHole(0, @val1))
		@$me.append(@createEnemyHole(1, @val2))
		@$me.append(@createEnemyHole(2, @val3))

	createEnemyHole: (pos, type) ->
		hole = $("<div class='enemyHole #{type}'>")
		hole.css('left', @POS[pos])
		hole

$(document).ready(->
	window.game = new Game()
);