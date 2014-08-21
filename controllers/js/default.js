(function() {
  var error400, error401, error403, error404, error408, error431, error500;

  exports.install = function(framework) {
    framework.route("#400", error400);
    framework.route("#401", error401);
    framework.route("#403", error403);
    framework.route("#404", error404);
    framework.route("#408", error408);
    framework.route("#431", error431);
    framework.route("#500", error500);
  };

  error400 = function() {
    var self;
    self = this;
    self.status = 400;
    self.plain(utils.httpStatus(self.status));
  };

  error401 = function() {
    var self;
    self = this;
    self.status = 401;
    self.plain(utils.httpStatus(self.status));
  };

  error403 = function() {
    var self;
    self = this;
    self.status = 403;
    self.plain(utils.httpStatus(self.status));
  };

  error404 = function() {
    var self;
    self = this;
    self.status = 404;
    self.plain(utils.httpStatus(self.status));
  };

  error408 = function() {
    var self;
    self = this;
    self.status = 408;
    self.plain(utils.httpStatus(self.status));
  };

  error431 = function() {
    var self;
    self = this;
    self.status = 431;
    self.plain(utils.httpStatus(self.status));
  };

  error500 = function() {
    var self;
    self = this;
    self.status = 500;
    self.plain(utils.httpStatus(self.status));
  };

}).call(this);
