var Game    = window.Game;
var X       = window.X;
var O       = window.O;
var Empty   = window.Empty;
var Failure = window.Failure;

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

test("An X token can be placed on spaces 0-8", function() {
  var i    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = 0; i < 9; i++) {
    ok(!(game.tryToPlaceXToken(i) instanceof Failure));
    ok(game.tokenAt(i) instanceof X);
  }
});

test("An X token cannot be placed on a space which isn't between 0 and 8", function() {
  var i    = 0;
  var n    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = -100; i < 0; i++) {
    ok(game.tryToPlaceXToken(i) instanceof Failure);
    for(n = 0; n < 9; n++) {
      ok(game.tokenAt(n) instanceof Empty);
    }
  }
  for(i = 9; i < 100; i++) {
    ok(game.tryToPlaceXToken(i) instanceof Failure);
    for(n = 0; n < 9; n++) {
      ok(game.tokenAt(n) instanceof Empty);
    }
  }
});

test("An O token can be placed on spaces 0-8", function() {
  var i    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = 0; i < 9; i++) {
    ok(!(game.tryToPlaceOToken(i) instanceof Failure));
    ok(game.tokenAt(i) instanceof O);
  }
});

test("An O token cannot be placed on a space which isn't between 0 and 8", function() {
  var i    = 0;
  var n    = 0;
  var game = new Game({x: X, o: O, empty: Empty});
  for(i = -100; i < 0; i++) {
    ok(game.tryToPlaceOToken(i) instanceof Failure);
    for(n = 0; n < 9; n++) {
      ok(game.tokenAt(n) instanceof Empty);
    }
  }
  for(i = 9; i < 100; i++) {
    ok(game.tryToPlaceOToken(i) instanceof Failure);
    for(n = 0; n < 9; n++) {
      ok(game.tokenAt(n) instanceof Empty);
    }
  }
});

test("A game can return its board stringified for a query parameter", function() {
  var game = new Game({x: X, o: O, empty: Empty});
  var expectedString = "eeeeeeeee";
  ok(game.boardQueryString() === expectedString);

  game.tryToPlaceXToken(0);
  expectedString = "xeeeeeeee";
  ok(game.boardQueryString() === expectedString);

  game.tryToPlaceOToken(1);
  expectedString = "xoeeeeeee";
  ok(game.boardQueryString() === expectedString);
});
