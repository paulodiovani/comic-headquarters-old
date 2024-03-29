expect  = require('chai').expect
request = require('supertest')
 
app     = require('../../../server/app')

describe 'GET /api/things', ->

  it 'respond with JSON array', (done) ->
    request app
      .get '/api/things'
      .expect 200
      .expect 'Content-Type', /json/
      .end (err, res) ->
        return done(err) if err
        expect(res.body).be.instanceof(Array)
        done()