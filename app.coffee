express = require 'express'
mongooseRouter = require 'mongoose-router'
multipart = require 'connect-multiparty'
child_process = require 'child_process'
mapper = require './confMapper'
AsteriskManager = require 'asterisk-manager'

models = require './models'
config = require './config'

ami = new AsteriskManager config.ami.port, config.ami.host, config.ami.username, config.ami.password
ami.keepConnected()
if config.ami.debug
  ami.on 'error', console.log

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

app.get '/parts/:name', (req, res)->
  res.render "parts/#{req.params.name}"

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

app.post '/files/save', multipart(), (req, res)->
  name = req.body.name
  fname = req.files.file.name
  ext = fname.split('.')[1]
  fpath = req.files.file.path
  path = "#{config.filePath}/#{name}.#{ext}"
  child_process.exec("mv #{fpath} #{path}")
  res.redirect('/')

app.get '/sip/reload', (req, res)->
  ami.action
    action: 'command'
    command: 'sip reload'
  , (err, res)->
    console.log err if err
    console.log res if res

  res.send 200

app.listen 3000