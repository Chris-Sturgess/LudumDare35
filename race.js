// Generated by CoffeeScript 1.10.0
var Character, Game,
  bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Game = (function() {
  Game.car;

  Game.$gameBox;

  function Game() {
    this.$gameBox = $('#gameBox');
    this.car = new Character();
  }

  Game.prototype.$ = function(s) {
    return this.$gameBox.find(s);
  };

  return Game;

})();

Character = (function() {
  Character.prototype.CIRCLE = 'circle';

  Character.prototype.TRIANGLE = 'triangle';

  Character.prototype.SQUARE = 'square';

  Character.prototype.POS = [150, 300, 450];

  Character.prototype.myWidth = 30;

  Character.prototype.myHeight = 30;

  Character.prototype.myTop = 400;

  Character.myPos;

  Character.$me;

  Character.type;

  function Character() {
    this.setLoc = bind(this.setLoc, this);
    this.$me = $('.character');
    this.initChar();
  }

  Character.prototype.initChar = function() {
    this.setType(this.SQUARE);
    return this.setLoc(0);
  };

  Character.prototype.setLoc = function(l) {
    this.myPos = l;
    return this.$me.offset({
      left: this.POS[l],
      top: this.myTop
    });
  };

  Character.prototype.setType = function(type) {
    this.$me.removeClass(this.CIRCLE);
    this.$me.removeClass(this.SQUARE);
    this.$me.removeClass(this.TRIANGLE);
    this.type = type;
    return this.$me.addClass(this.type);
  };

  return Character;

})();

$(document).ready(function() {
  return window.game = new Game();
});
