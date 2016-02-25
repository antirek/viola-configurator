module.exports =
  port: 3000
  filePath: "#{__dirname}/uploads"
  sipConf: '/etc/asterisk/sip_viola_configurator.conf'
  mongodb: 'mongodb://127.0.0.1:27017/viola'
  ami:
    port: 5038
    host: 'localhost'
    username: 'admin'
    password: 'admin'
    debug: false