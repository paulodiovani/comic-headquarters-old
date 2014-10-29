'use strict'

angular.module 'comicHqApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'pages/:name',
    url: '/pages/:name'
    templateUrl: 'app/pages/pages.html'
    controller: 'PagesCtrl'