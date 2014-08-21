(function() {
  exports.name = 'subscriber';

  exports.save = function(data) {
    return console.log('save model:', data);
  };

}).call(this);
