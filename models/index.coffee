mongoose = require 'mongoose'
Schema = mongoose.Schema
db = mongoose.createConnection 'mongodb://localhost/viola'

sipConfigs = require './sipConfigs'
extensions = require './extensions'

module.exports =
  sipConfigs: db.model 'sipConfigs', new Schema sipConfigs
  extensions: db.model 'extensions', new Schema extensions