angular.module 'viola'
.factory 'SipConfigs', ['$resource', ($resource)->
  $resource '/sipConfigs/:id', id: '@_id'
]