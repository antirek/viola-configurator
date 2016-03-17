#!/usr/bin/node

configfile = process.env.VIOLACONFIGURATOR_CONFIG || './config';

fileExists = require 'file-exists'
conf = configfile + '.js'
console.log 'use conf file:', conf

if (fileExists(conf))
  config = require configfile
  App = require './index'

  app = new App config
  app.start()
else
  console.log 'no configfile:', conf