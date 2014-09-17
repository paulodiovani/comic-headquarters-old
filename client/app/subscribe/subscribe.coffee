'use strict'

angular.module 'comicHqApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'subscrive',
    url: '/subscribe'
    templateUrl: 'app/subscribe/subscribe.html'
    controller: 'SubscribeCtrl'