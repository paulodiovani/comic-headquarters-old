var mongoose = require('mongoose');
mongoose.connect(framework.config['mongodb-url']);

global.mongoose = mongoose;