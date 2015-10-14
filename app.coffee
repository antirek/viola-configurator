express = require 'express'
mongooseRouter = require 'mongoose-router'

models = require './models'

app = express()

app.set 'views', "views"
app.set 'view engine', 'jade'
app.use '/bower_components', express.static "bower_components"
app.use '/public', express.static "public"

app.use '/extensions', mongooseRouter models.extensions
app.use '/sipConfigs', mongooseRouter models.sipConfigs

app.get '/', (req, res)->
  res.render 'index'

app.listen 3000