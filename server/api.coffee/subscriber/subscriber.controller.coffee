mcapi = require('mailchimp-api/mailchimp')
config = require('../../config/environment')

mc = new mcapi.Mailchimp config.mailchimp.apikey

# íd da lista Comic Headquarters
listId = '4d58964c4f'

# Grupo de interesse
intGroupId   = 11265

exports.subscribe = (req, res) ->
  groupName = if req.body.type is 'author' then 'Autor' else 'Leitor'

  mc.lists.subscribe
    id: listId
    email:
      email: req.body.email
    merge_vars:
      groupings: [
        id: intGroupId
        groupd: [groupName]
      ]
  , (data) ->
    res.send 201, data
  , (err) ->
    res.send 500, err.error