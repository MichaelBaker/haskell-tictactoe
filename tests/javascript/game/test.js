var Game  = window.Game;
var X     = window.X;
var O     = window.O;
var Empty = window.Empty;

test("Game takes a set of tokens on initialization", function() {
  var game = new Game({x: X, o: O, empty: Empty});
	ok(game);
});

test("A game starts with all spaces empty", function() {
  var i    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = 0; i < 9; i++) {
    ok(game.tokenAt(i) instanceof Empty);
  }
});

test("A token can be placed on spaces 0-8", function() {
  var i    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = 0; i < 9; i++) {
    ok(game.placeXToken(i));
    ok(game.tokenAt(i) instanceof X);
  }
});

test("A token cannot be placed on a space which isn't between 0 and 8", function() {
  var i    = 0;
  var n    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = -100; i < 0; i++) {
    ok(!game.placeXToken(i));
    for(n = 0; n < 9; n++) {
      ok(game.tokenAt(n) instanceof Empty);
    }
  }
  for(i = 9; i < 100; i++) {
    ok(!game.placeXToken(i));
    for(n = 0; n < 9; n++) {
      ok(game.tokenAt(n) instanceof Empty);
    }
  }
});
