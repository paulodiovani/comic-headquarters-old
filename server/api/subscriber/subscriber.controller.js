var config, intGroupId, listId, mc, mcapi;

mcapi = require('mailchimp-api/mailchimp');

config = require('../../config/environment');

mc = new mcapi.Mailchimp(config.mailchimp.apikey);

listId = '4d58964c4f';

intGroupId = 11265;

exports.subscribe = function(req, res) {
  var groupName;
  groupName = req.body.type === 'author' ? 'Autor' : 'Leitor';
  return mc.lists.subscribe({
    id: listId,
    email: {
      email: req.body.email
    },
    merge_vars: {
      groupings: [
        {
          id: intGroupId,
          groupd: [groupName]
        }
      ]
    }
  }, function(data) {
    return res.send(201, data);
  }, function(err) {
    return res.send(500, err.error);
  });
};

//# sourceMappingURL=subscriber.controller.js.map
