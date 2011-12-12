window.Empty = function() {
  this.toString = function() {
    return "";
  };

  this.toQueryString = function() {
    return "e";
  };
};
