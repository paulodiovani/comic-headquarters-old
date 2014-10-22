expect = require('chai').expect
app    = require('../../app')
User   = require('../../api/user/user.model')

user = new User
  provider: 'local',
  name: 'Fake User',
  email: 'test@test.com',
  password: 'password'

describe 'User Model', ->
  before (done) ->
    # Clear users before testing
    User.remove().exec().then ->
      done()

  afterEach (done) ->
    User.remove().exec().then ->
      done()

  it 'begin with no users', (done) ->
    User.find {}, (err, users) ->
      expect(users).to.have.length(0)
      done()

  it 'fail when saving a duplicate user', (done) ->
    user.save ->
      userDup = new User(user)
      userDup.save (err) ->
        expect(err).to.exist
        done()

  it 'fail when saving without an email', (done) ->
    user.email = ''
    user.save (err) ->
      expect(err).to.exist
      done()

  it 'authenticate user if password is valid', ->
    expect(user.authenticate('password')).to.be.true

  it 'not authenticate user if password is invalid', ->
    return expect(user.authenticate('blah')).not.be.true