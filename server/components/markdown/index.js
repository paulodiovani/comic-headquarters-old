
/*
Markdown processor for pages in `views/markdown/`
 */
'use scrict';
var errors, fs, marked;

fs = require('fs');

marked = require('marked');

errors = require('../errors');

marked.setOptions({
  gfm: true,
  tables: true,
  breaks: false,
  sanitize: false,
  smartLists: true,
  smartypants: true
});

module.exports = function(app) {
  var renderMarkdown;
  renderMarkdown = function(req, res) {
    var viewPath;
    viewPath = "" + (app.get('views')) + "/markdown/" + req.params.name + ".md";
    return fs.exists(viewPath, function(exists) {
      if (!exists) {
        return errors[404](req, res);
      }
      return fs.readFile(viewPath, {
        encoding: 'utf8'
      }, function(err, data) {
        var html;
        if (err != null) {
          throw err;
        }
        html = marked(data.toString());
        return res.send(html);
      });
    });
  };
  return renderMarkdown;
};

//# sourceMappingURL=index.js.map
