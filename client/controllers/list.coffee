angular.module 'viola'
.controller 'ListController', [
  '$scope',
  '$state',
  '$stateParams',
  'Models',
  ($scope, $state, $stateParams, Models)->
    $scope.modelName = $stateParams.modelname
    if !$scope.modelName
      $state.go 'main', {}, reload: true
    $scope.models = []
    $scope.models = Models[$scope.modelName].query()

]