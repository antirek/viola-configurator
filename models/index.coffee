mongoose = require 'mongoose'
Schema = mongoose.Schema
db = mongoose.createConnection 'mongodb://localhost/viola'

sipConfigs = require './sipConfigs'
extensions = require './extensions'
getAttributes = (modelsConfig)->
  result = []
  for key of modelsConfig
    result.push key
  result

module.exports =
  SipConfigs: db.model 'sipConfigs', new Schema sipConfigs
  Extensions: db.model 'extensions', new Schema extensions
  disconnect: ()->
    mongoose.disconnect (err)->
      console.log err if err
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