var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/comic-hq');

global.mongoose = mongoose;