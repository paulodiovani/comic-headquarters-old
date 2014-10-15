'use strict'

angular.module 'comicHqApp'
.controller 'SubscribersCtrl', ($scope, Subscriber, $location) ->
  $scope.subscriber = {}
  $scope.errors = {}

  $scope.register = (form) ->
    $scope.submitted = true

    if form.$valid
      subscriber = new Subscriber
        email: $scope.subscriber.email
        type: $scope.subscriber.type
      
      subscriber.$save()
      .then (data, headers) ->
        console.log 'success', data, headers
      .catch (headers) ->
        console.error 'failed', headers
        # err = err.data
        # $scope.errors = {}
      

  $scope.setType = (type, $event) ->
    $scope.subscriber.type = type