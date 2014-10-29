angular.module 'comicHqApp'
.controller 'PagesCtrl', ($scope, $state) ->
  $scope.template = "/markdown/#{$state.params.name}"
