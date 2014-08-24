var mongoose = require('mongoose');

var user   = CONFIG('mongodb-user'),
    pass   = CONFIG('mongodb-pass'),
    server = CONFIG('mongodb-server') || process.env.OPENSHIFT_MONGODB_DB_HOST,
    port   = CONFIG('mongodb-port') || process.env.OPENSHIFT_MONGODB_DB_PORT,
    db     = CONFIG('mongodb-database');

var url = 'mongodb://' + user + ':' + pass + '@' + server + ':' + port + '/' + db;

mongoose.connect(url);
global.mongoose = mongoose;