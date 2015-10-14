angular.module 'viola'
.factory 'Models', ['SipConfigs', 'Extensions', (SipConfigs, Extensions)->
  sip_configs: SipConfigs
  extensions: Extensions
  getModels: ()->
    ['sip_configs', 'extensions']
  getModelsAttributes: (modelName)->
    attributes =
      sip_configs:['name','secret']
      extensions:['name','target']
    attributes[modelName]
]