express = require 'express'
mongooseRouter = require 'mongoose-router'
mapper = require './confMapper'

models = require './models'

app = express()

app.set 'views', "views"
app.set 'view engine', 'jade'
app.use '/bower_components', express.static "bower_components"
app.use '/public', express.static "public"

modelsMap = models.getModelsMap()
for key of modelsMap
  model = modelsMap[key]
  app.use '/' + model.url, mongooseRouter models[model.name]

app.get '/', (req, res)->
  res.render 'index'

app.get '/config/save', (req, res)->
  models.Users.find (err, configs)->
    mapper.map configs, (config)->
      name: config.peername
      secret: config.secret
      type: config.type
      context: config.context
      host: config.host
      qualify: config.qualify
    , '/etc/asterisk/sip_viola_configurator.conf', (err)->
      if err
        res.send 500
      else
        res.send 200

app.listen 3000