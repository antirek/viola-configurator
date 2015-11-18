sipConfigs = require './sipConfigs'
extensions = require './extensions'
getAttributes = (modelsConfig)->
  result = []
  for key of modelsConfig
    result.push key
  result

module.exports =
  getModelsMap: ()->
    [
      name: 'SipConfigs'
      url: 'sipConfigs'
      title: 'sipConfigs'
      attributes: getAttributes(sipConfigs)
    ,
      name: 'Extensions'
      url: 'extensions'
      title: 'extensions'
      attributes: getAttributes(extensions)
    ]