(function() {
  var home, subscribe;

  exports.install = function(framework) {
    framework.route("/", home);
    framework.route("/subscribe", subscribe);
    return framework.route("/subscribe", subscribe, ['post']);
  };

  home = function() {
    return this.view("cover");
  };

  subscribe = function() {
    var Subscriber, post, self;
    self = this;
    post = self.post;
    if (post.email) {
      Subscriber = self.model('subscriber');
      return Subscriber.save(post, function(err, subscriber) {
        if (err) {
          return self.view("form", {
            subscribed: false,
            errormsg: err
          });
        } else {
          return self.view("form", {
            subscribed: true
          });
        }
      });
    } else {
      return self.view("form");
    }
  };

}).call(this);
