users = require './users'
ivrs = require './ivrs'
queues = require './queues'

module.exports =
  getModelsMap: ()->
    Users:
      name: 'Users'
      url: 'users'
      title: 'users'
      schema: users.schema
      form: users.form
    Queues:
      name: 'Queues'
      url: 'queues'
      title: 'queues'
      schema: queues.schema
      form: queues.form
    Ivrs:
      name: 'Ivrs'
      url: 'ivrs'
      title: 'ivrs'
      schema: ivrs.schema
      form: ivrs.form