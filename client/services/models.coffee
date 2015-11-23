angular.module 'viola'
.factory 'Models', ['$resource', ($resource)->
  modelsMap = JSON.parse '{{modelsMap}}'
  console.log modelsMap
  models =
    getModels: ()->
      result = []
      for key of modelsMap
        result.push modelsMap[key].name
      result
    getModelAttributes: (modelName)->
      result = {}
      for key of modelsMap
        result[modelsMap[key].name] = modelsMap[key].attributes
      result[modelName]
  for key of modelsMap
    model = modelsMap[key]
    models[model.name] = $resource "/#{model.url}/:id", id: '@_id'
  models
]