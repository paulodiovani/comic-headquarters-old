'use strict'

angular.module 'comicHqApp'
.factory 'Subscriber', ($resource) ->
  $resource '/api/subscribers',
    add:
      method: 'POST'
