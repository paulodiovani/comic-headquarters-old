module.exports = (grunt) ->

  # project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # Observe file modifications
    watch:
      gruntfile:
        files: ['Gruntfile.coffee']
        tasks: ['coffeelint:gruntfile']
      node:
        files: ['controllers/coffee/**/*.coffee']
        tasks: ['coffeelint:node', 'coffee:node',]
        options:
          spawn: false
      browser:
        files: ['public/coffee/**/*.coffee']
        tasks: ['coffeelint:browser', 'coffee:browser']
        options:
          spawn: false

    # Check for syntax
    coffeelint:
      gruntfile: ['Gruntfile.coffee']
      node: ['controllers/coffee/**/*.coffee']
      browser: ['public/coffee/**/*.coffee']
      options:
        configFile: 'coffeelint.json'

    # Compile files
    coffee:
      node:
        expand: true
        flatten: false
        cwd: 'controllers/coffee/'
        src: ['**/*.coffee']
        dest: './controllers/js/'
        ext: '.js'
      browser:
        options:
          bare: true
        expand: true
        flatten: false
        cwd: 'public/coffee/'
        src: ['**/*.coffee']
        dest: './public/js/'
        ext: '.js'

  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # default task(s)
  grunt.registerTask 'default', [
    'coffeelint',
    'coffee',
    'debug',
    'watch'
  ]

  # other tasks
  grunt.registerTask 'debug', ->
    require './debug.js'

  # don't return nothing
  return