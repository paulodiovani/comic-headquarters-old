# framework
exports.install = (framework) ->
  framework.route "/", home
  framework.route "/subscribe", subscribe
  framework.route "/subscribe", subscribe, ['post']

# home action (start page)
home = ->
  this.view "cover"

# subscribe form and action
subscribe = ->
  self = this
  post = self.post

  if post.email
    Subscriber = self.model('subscriber')
    Subscriber.save post

  # TODO: save the e-mail and show a message

  self.view "form"
