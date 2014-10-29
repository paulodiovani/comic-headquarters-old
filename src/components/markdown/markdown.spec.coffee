expect  = require('chai').expect
request = require('supertest')
fs      = require('fs')

app     = require('../../../server/app')

describe 'Markdown', ->
  @timeout 5000

  # Create some files for testing
  before (done) ->
    fs.writeFile "#{app.get('views')}/markdown/hello-world-test.md",
      "**Hello World!**", done
  before (done) ->
    fs.writeFile "#{app.get('views')}/markdown/markdown-test.md",
      "# Markdown test", done

  it 'renders "Hello World!"', (done) ->
    request app
      .get '/markdown/hello-world-test'
      .expect 200
      .expect 'Content-Type', /text\/html/
      .end (err, res) ->
        return done(err) if err
        expect(res.text).to.be.equal '<p><strong>Hello World!</strong></p>\n'
        done()

  it 'renders "Markdown test"', (done) ->
    request app
      .get '/markdown/markdown-test'
      .expect 200
      .expect 'Content-Type', /text\/html/
      .end (err, res) ->
        return done(err) if err
        expect(res.text).to.be.equal '<h1 id="markdown-test">Markdown test</h1>\n'
        done()

  # Delete the created files
  after (done) ->
    fs.unlink "#{app.get('views')}/markdown/hello-world-test.md", done
  after (done) ->
    fs.unlink "#{app.get('views')}/markdown/markdown-test.md", done
