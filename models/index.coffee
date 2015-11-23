mongoose = require 'mongoose'
Schema = mongoose.Schema
db = mongoose.createConnection 'mongodb://localhost/viola'

sipConfigs = require './sipConfigs'
extensions = require './extensions'
ivrs = require './ivrs'
config = require './config'
module.exports =
  SipConfigs: db.model 'sipConfigs', new Schema sipConfigs
  Extensions: db.model 'extensions', new Schema extensions
  Ivrs: db.model 'ivrs', new Schema ivrs
  disconnect: ()->
    mongoose.disconnect (err)->
      console.log err if err
  getModelsMap: ()->
    config.getModelsMap()