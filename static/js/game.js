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

  this.placeXToken = function(space) {
    if(space < spaces.length && space >= 0 && spaces[space] instanceof emptyToken) {
      spaces[space] = new xToken();
      return true;
    } else {
      return false;
    }
  };

  this.tokenAt = function(space) {
    return spaces[space];
  };
};
