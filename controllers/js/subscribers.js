(function() {
  var home, subscribe;

  exports.install = function(framework) {
    framework.route("/", home);
    return framework.route("/subscribe", subscribe);
  };

  home = function() {
    return this.view("cover");
  };

  subscribe = function() {
    return this.view("form");
  };

}).call(this);
