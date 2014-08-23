var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/comichq');

global.mongoose = mongoose;