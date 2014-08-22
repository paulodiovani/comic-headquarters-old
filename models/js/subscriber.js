(function() {
  var Subscriber, subscriberSchema;

  subscriberSchema = mongoose.Schema({
    email: String,
    type: String,
    created: Date
  });

  Subscriber = mongoose.model('user', userSchema);

  exports.name = 'subscriber';

  exports.save = function(data, callback) {
    return Subscriber.find({
      email: data.email
    }, function(err, records) {
      var subs;
      if (records.length > 0) {
        return callback("E-mail já cadastrado");
      } else {
        subs = new Subscriber({
          email: data.email,
          type: data.type,
          created: new Date()
        });
        return subs.save(function() {
          return callback(null, subs);
        });
      }
    });
  };

}).call(this);
