// ===================================================
// IMPORTANT: only for production
// total.js - web application framework for node.js
// http://www.totaljs.com
// ===================================================

var options = {};

options.ip   = process.env.OPENSHIFT_NODEJS_IP || process.env.OPENSHIFT_INTERNAL_IP || '127.0.0.1';
options.port = process.env.OPENSHIFT_NODEJS_PORT ||  process.env.OPENSHIFT_INTERNAL_PORT || 8080;

// options.config = { name: 'total.js' };
// options.https = { key: fs.readFileSync('keys/agent2-key.pem'), cert: fs.readFileSync('keys/agent2-cert.pem')};

/**
 * Release notes:
 */

require('total.js').http('release', options);
// require('total.js').https('release', options);
