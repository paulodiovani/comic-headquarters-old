(function() {
  var Subscriber, subscriberSchema;

  subscriberSchema = mongoose.Schema({
    email: String,
    type: String,
    created: Date
  });

  Subscriber = mongoose.model('subscriber', subscriberSchema);

  exports.name = 'subscriber';

  exports.save = function(data, callback) {
    return Subscriber.find({
      email: data.email
    }, function(err, records) {
      var subs;
      if (err) {
        console.error(err);
        return callback("Ocorreu um erro ao inscrever seu endereço de e-mail. Tente novamente mais tarde");
      } else if (records.length > 0) {
        return callback("Endereço de e-mail já inscrito");
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
