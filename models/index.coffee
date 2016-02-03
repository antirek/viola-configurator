mongoose = require 'mongoose'
Schema = mongoose.Schema

models = (conf) ->

  db = mongoose.createConnection conf.mongodb

  users = require './users'
  ivrs = require './ivrs'
  queues = require './queues'
  config = require './config'

  Users: db.model 'users', new Schema users
  Queues: db.model 'queues', new Schema queues
  Ivrs: db.model 'ivrs', new Schema ivrs
  disconnect: ()->
    mongoose.disconnect (err)->
      console.log err if err
  getModelsMap: ()->
    config.getModelsMap()

module.exports = models