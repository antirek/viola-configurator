angular.module 'viola'
.factory 'Extensions', ['$resource', ($resource)->
  $resource '/extensions/:id', id: '@_id'
]