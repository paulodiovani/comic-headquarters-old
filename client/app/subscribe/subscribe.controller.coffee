'use strict'

angular.module 'comicHqApp'
.controller 'SubscribeCtrl', ($scope, Subscriber, $location) ->
  $scope.subscriber = {}
  $scope.errors = {}

  $scope.register = (form) ->
    $scope.submitted = true

    if form.$valid
      Subscriber.add
        email: $scope.subscriber.email
        type: $scope.subscriber.type

      .then ->
        $location.path '/'

      .catch (err) ->
        err = err.data
        $scope.errors = {}
      

  $scope.setType = (type, $event) ->
    $scope.subscriber.type = type