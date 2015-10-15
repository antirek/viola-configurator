angular.module 'viola'
.controller 'ModelController', [
  '$scope',
  '$state',
  '$stateParams',
  'Models',
  ($scope, $state, $stateParams, Models)->
    $scope.modelName = $stateParams.modelname
    if !$scope.modelName
      $state.go 'main', {}, reload: true
    id = $stateParams.id
    $scope.attributes = Models.getModelAttributes($scope.modelName)
    if id
      $scope.new = false
      $scope.model = Models[$scope.modelName].get id: id
    else
      $scope.new = true
      $scope.model = new Models[$scope.modelName] $scope.attributes

    $scope.save = ()->
      $scope.model.$save ()->
        $state.go 'main.list', {modelname: $scope.modelName}, reload: true

    $scope.delete = ()->
      $scope.model.$delete ()->
        $state.go 'main.list', {modelname: $scope.modelName}, reload: true
]