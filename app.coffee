express = require 'express'
mongooseRouter = require 'mongoose-router'

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

app.listen 3000