window.Game = function(tokens) {
  var xToken     = tokens.x;
  var oToken     = tokens.o;
  var emptyToken = tokens.empty;

  var i = 0;

  var isPlayerTurn = false;
  var spaces = [];

  for(i = 0; i < 9; i++) {
    spaces.push(new emptyToken());
  }

  var tryToPlaceToken = function(token, space) {
    if(space < spaces.length && space >= 0 && spaces[space] instanceof emptyToken) {
      spaces[space] = new token();
      return true;
    } else {
      return new Failure();
    }
  };

  this.tryToPlaceXToken = function(space) {
    return tryToPlaceToken(xToken, space);
  };

  this.tryToPlaceOToken = function(space) {
    return tryToPlaceToken(oToken, space);
  };

  this.tokenAt = function(space) {
    return spaces[space];
  };

  this.boardQueryString = function() {
    var spaceStrings = _(spaces).map(function(space) {
      return space.toQueryString();
    });
    return spaceStrings.join("");
  };
};

window.Game.fromArray = function(tokens, array) {
  var i = 0;
  var game = new Game(tokens);

  _(array).each(function(tokenString, index) {
    if(tokenString === "X") {
      game.tryToPlaceXToken(index);
    } else if(tokenString === "O") {
      game.tryToPlaceOToken(index);
    }
  });

  return game;
};
