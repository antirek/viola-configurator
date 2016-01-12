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
      $scope.model = new Models[$scope.modelName]

    $scope.save = ()->
      $scope.model.$save ()->
        $state.go 'main.models', {modelname: $scope.modelName}, reload: true

    $scope.delete = ()->
      $scope.model.$delete ()->
        $state.go 'main.models', {modelname: $scope.modelName}, reload: true

    $scope.getObjectkeys = (object)->
      Object.keys(object).filter (value)->
        value != '$$hashKey'

    $scope.addRow = (attribute, object)->
      if  !$scope.model[attribute]
        $scope.model[attribute] = []
      addedObject = {}
      for key of  $scope.getObjectkeys(object)
        addedObject[$scope.getObjectkeys(object)[key]] = ''
      $scope.model[attribute].push(addedObject)

    $scope.delRow = (attribute, index)->
      $scope.model[attribute].splice(index, 1)

]