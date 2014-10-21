'use strict'

angular.module 'comicHqApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'cover',
    url: '/'
    templateUrl: 'app/subscriber/cover.html'
  .state 'subscribe',
    url: '/subscribe'
    templateUrl: 'app/subscriber/subscribe.html'
    controller: 'SubscriberCtrl'