###
Markdown processor for pages in `views/markdown/`
###

'use scrict'

fs = require('fs')
marked = require('marked')
errors = require('../errors')

marked.setOptions
  gfm: true
  tables: true
  breaks: false
  sanitize: false
  smartLists: true
  smartypants: true

module.exports = (app) ->
  # Render a markdown requested file
  renderMarkdown = (req, res) ->
    viewPath = "#{app.get 'views'}/markdown/#{req.params.name}.md"

    fs.exists viewPath, (exists) ->
      return errors[404](req, res) if not exists
      
      fs.readFile viewPath, {encoding: 'utf8'}, (err, data) ->
        throw err if err?

        html = marked data.toString()
        res.send html

  return renderMarkdown