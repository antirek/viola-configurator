angular.module 'viola'
.controller 'MainController', [
  '$scope',
  '$state',
  '$stateParams',
  'Models',
  ($scope, $state, $stateParams, Models)->
    $scope.models = Models.getModels()
]