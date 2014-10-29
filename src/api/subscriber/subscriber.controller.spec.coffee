expect  = require('chai').expect
request = require('supertest')

app     = require('../../../server/app')

describe 'Subscriber controller', ->
  @timeout 5000

  it 'register a new e-mail'
  , (done) ->
    request app
      .post '/api/subscribers'
      .send email: 'test@webcomic.com.br', type: 'author'
      .expect 201
      .expect 'Content-Type', /json/
      .end (err, res) ->
        return done(err.error) if err?
        expect(res.body).to.be.an 'object'
        expect(res.body).to.have.property('euid').that.is.not.null
        done()