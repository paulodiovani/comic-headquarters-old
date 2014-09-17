'use strict'

angular.module 'comicHqApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'cover',
    url: '/'
    templateUrl: 'app/cover/cover.html'
    controller: 'CoverCtrl'
