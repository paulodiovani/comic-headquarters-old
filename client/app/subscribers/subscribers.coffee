'use strict'

angular.module 'comicHqApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'cover',
    url: '/'
    templateUrl: 'app/subscribers/cover.html'
  .state 'subscribe',
    url: '/subscribe'
    templateUrl: 'app/subscribers/subscribe.html'
    controller: 'SubscribersCtrl'