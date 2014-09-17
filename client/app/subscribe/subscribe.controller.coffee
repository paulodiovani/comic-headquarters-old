'use strict'

angular.module 'comicHqApp'
.controller 'SubscribeCtrl', ($scope) ->
  $scope.subscriber = {}
  $scope.errors = {}
  $scope.register = (form) ->
    $scope.submitted = true

    # if form.$valid
    console.log $scope.subscriber
