subscriberSchema = mongoose.Schema
  email: String
  type: String
  created: Date

Subscriber       = mongoose.model 'subscriber', subscriberSchema

exports.name = 'subscriber'

exports.save = (data, callback) ->
  Subscriber.find {email: data.email}, (err, records) ->
    if err
      console.error err
      callback "Ocorreu um erro ao inscrever seu endereço de e-mail.
        Tente novamente mais tarde"
    else if records.length > 0
      callback "Endereço de e-mail já inscrito"
    else
      subs = new Subscriber
        email: data.email
        type: data.type
        created: new Date()
      subs.save ->
        callback null, subs
  