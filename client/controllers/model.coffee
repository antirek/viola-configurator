angular.module 'viola'
.controller 'ModelController', [
  '$scope',
  '$state',
  '$stateParams',
  'Models',
  ($scope, $state, $stateParams, Models)->
    $scope.modelName = $stateParams.modelname

    $scope.Model = Models.getModels()[$scope.modelName]

    if !$scope.modelName
      $state.go 'main', {}, reload: true
    id = $stateParams.id

    if id
      $scope.new = false
      $scope.model = Models[$scope.modelName].get id: id
    else
      $scope.new = true
      $scope.model = new Models[$scope.modelName]


    $scope.save = ()->
      $scope.model.$save ()->
        $state.go 'main.models', {modelname: $scope.modelName}, reload: true

    $scope.delete = ()->
      $scope.model.$delete ()->
        $state.go 'main.models', {modelname: $scope.modelName}, reload: true


]