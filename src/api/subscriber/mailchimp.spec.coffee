expect = require('chai').expect
mcapi = require('mailchimp-api/mailchimp')

config = require('../../../server/config/environment')

mc = new mcapi.Mailchimp config.mailchimp.apikey

# íd da lista Comic Headquarters
listId   = '4d58964c4f'
listName = 'Comic Headquarters'

# Grupo de interesse
intGroupId   = 11265
intGroupName = 'Web comics'

describe 'MailChimp', ->
  @timeout 5000

  it 'has an API key', ->
    expect(config.mailchimp.apikey).to.be.not.null
    expect(config.mailchimp.apikey).to.be.a 'string'
    expect(config.mailchimp.apikey.length).to.be.above 32

  it 'is initialized', ->
    expect(mc).to.be.not.null
    expect(mc).to.be.an 'object'
    expect(mc).to.be.instanceof mcapi.Mailchimp

  it 'connects', (done) ->
    mc.helper.ping (data) ->
      done()
    , (err) ->
      done err

  it 'has Comic HQ list', (done) ->
    mc.lists.list {}, (data) ->
      expect(data).to.have.property('total')
        .that.is.above 0
      expect(data).to.have.property('data')
        .that.is.an('array')
      expect(data).to.have.property('data')
        .that.has.deep.property '[0].name', listName
      expect(data).to.have.property('data')
        .that.has.deep.property '[0].id', listId
      done()
    , done # error

  it "has Author and Reader groups in list #{listName}", (done) ->
    mc.lists.interestGroupings
      id: listId
    , (data) ->
      expect(data).to.be.an('array')
        .that.has.length.above 0
      expect(data).to.have.deep.property '[0].name', intGroupName
      expect(data).to.have.deep.property '[0].id', intGroupId
      expect(data).to.have.deep.property('[0].groups')
        .that.is.an('array')
      expect(data).to.have.deep.property '[0].groups.[0].name', 'Leitor'
      expect(data).to.have.deep.property '[0].groups.[1].name', 'Autor'
      done()
    , done # error

  it 'register a new e-mail', (done) ->
    mc.lists.subscribe
      id: listId
      email:
        email: 'test@webcomic.com.br'
      merge_vars:
        groupings: [
          id: intGroupId
          groupd: ['Leitor']
        ]
    , (data) ->
      expect(data).to.have.property('euid').that.is.not.null
      done()
    , done # error