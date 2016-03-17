mongoose = require 'mongoose'
Schema = mongoose.Schema

models = (conf) ->
  db = mongoose.createConnection conf.mongodb

  users = require './users'
  ivrs = require './ivrs'
  queues = require './queues'
  config = require './config'

  Users: db.model 'peer', new Schema users.mongo, collection: 'peer'
  Queues: db.model 'queue', new Schema queues.mongo, collection: 'queue'
  Ivrs: db.model 'ivr', new Schema ivrs.mongo, collection: 'ivr'
  disconnect: ()->
    mongoose.disconnect (err)->
      console.log err if err
  getModelsMap: ()->
    config.getModelsMap()

module.exports = models