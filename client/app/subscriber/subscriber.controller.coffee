angular.module 'comicHqApp'
.controller 'SubscriberCtrl', ($scope, Subscriber, $location) ->
  $scope.subscriber = {}
  $scope.errors = {}

  $scope.register = (form) ->
    $scope.submitted      = true
    $scope.messageSuccess = false
    $scope.messageWarning = false
    $scope.messageError   = false
    $scope.message        = "Aguarde..."

    if form.$valid
      subscriber = new Subscriber
        email: $scope.subscriber.email
        type: $scope.subscriber.type
      
      subscriber.$save()
      .then (data, headers) ->
        $scope.messageSuccess = true
        $scope.messageTitle = 'Registrado com sucesso.'
        $scope.message = 'Verifique seu e-mail para completar a inscrição.'
      .catch (headers) ->
        $scope.messageError = true
        $scope.messageTitle = 'Erro!'
        $scope.message = 'Houve um problema ao fazer seu registro.
          Favor, tente novamente mais tarde'
    else
      $scope.messageWarning = true
      $scope.message = 'Não foi possível registrar. Verifique o campo abaixo.'

  $scope.setType = (type, $event) ->
    $scope.subscriber.type = type

  $scope.clearMessages = ->
    $scope.submitted    = false
    $scope.messageError = false
    $scope.messageTitle = null
    $scope.message      = null