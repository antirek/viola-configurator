fs = require 'fs'
astconf = require 'astconf'

class ConfMapper
  map: (models, mapCallback, file, callback)->
    conf = astconf.encode @prepareModels(models, mapCallback)
    fs.writeFile file, conf, callback

  prepareModels: (models, mapCallback)->
    result = {}
    models = models.map mapCallback
    for key of models
      model = models[key]
      result[model.name] = model
    result

module.exports = new ConfMapper