angular.module 'viola'
.factory 'Models', ['$resource', ($resource)->
  modelsMap = JSON.parse '{{modelsMap}}'

  models =
    getModels: ()->
      modelsMap
  for key of modelsMap
    model = modelsMap[key]
    models[model.name] = $resource "/#{model.url}/:id", id: '@_id'
  models
]