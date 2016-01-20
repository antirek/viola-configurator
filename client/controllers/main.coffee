angular.module 'viola'
.controller 'MainController', [
  '$scope',
  '$state',
  '$stateParams',
  '$http',
  'Models',
  ($scope, $state, $stateParams, $http, Models)->
    $scope.models = Models.getModels()
    $scope.saveConfig = ()->
      $http.get '/config/save'
      .then ()->
        $scope.message = 'Conf file writed'
        setTimeout ()->
          $scope.message = ''
          $scope.$apply()
        , 5000
      , ()->
        $scope.message = 'Error'
        setTimeout ()->
          $scope.message = ''
          $scope.$apply()
        , 5000
    $scope.sipReload = ()->
      $http.get '/sip/reload'
      .then ()->
        console.log 'request send'
]