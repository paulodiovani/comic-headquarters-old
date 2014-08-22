subscriberSchema = mongoose.Schema
  email: String
  type: String
  created: Date

Subscriber       = mongoose.model 'user', userSchema

exports.name = 'subscriber'

exports.save = (data, callback) ->
  Subscriber.find {email: data.email}, (err, records) ->
    if records.length > 0
      callback "E-mail já cadastrado"
    else
      subs = new Subscriber
        email: data.email
        type: data.type
        created: new Date()
      subs.save ->
        callback null, subs
  