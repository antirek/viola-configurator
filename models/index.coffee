mongoose = require 'mongoose'
Schema = mongoose.Schema
config = require '../config'
db = mongoose.createConnection config.mongodb

users = require './users'
ivrs = require './ivrs'
queues = require './queues'
config = require './config'

module.exports =
  Users: db.model 'users', new Schema users
  Queues: db.model 'queues', new Schema queues
  Ivrs: db.model 'ivrs', new Schema ivrs
  disconnect: ()->
    mongoose.disconnect (err)->
      console.log err if err
  getModelsMap: ()->
    config.getModelsMap()