sipConfigs = require './sipConfigs'
extensions = require './extensions'
ivrs = require './ivrs'
getAttributes = (configObject)->
  result = []
  for field of configObject
    value = configObject[field]
    if typeof value is 'string' or typeof value is 'function'
      result.push
        name: field
        value: ''

    else if typeof value is 'array' or typeof value is 'object'
      arrres = {}
      object = value
      if value[0]
        object = value[0]
      for key of object
        arrres[key] = ''
      result.push
        name: field
        value: [arrres]
    else
      console.log 'field is nothing'
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
    ,
      name: 'Ivrs'
      url: 'ivrs'
      title: 'ivrs'
      attributes: getAttributes(ivrs)
    ]