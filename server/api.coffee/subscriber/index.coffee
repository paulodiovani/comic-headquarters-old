express = require('express')
controller = require('./subscriber.controller')

router = express.Router()

router.post '/', controller.subscribe

module.exports = router