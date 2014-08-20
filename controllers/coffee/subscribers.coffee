# framework
exports.install = (framework) ->
  framework.route "/", home
  framework.route "/subscribe", subscribe

# home action (start page)
home = ->
  this.view "cover"

# subscribe form and action
subscribe = ->
  this.view "form"