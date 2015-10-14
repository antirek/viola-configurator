angular.module 'viola'
.config ['$stateProvider', '$urlRouterProvider', ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  $stateProvider
  .state
      name: 'main'
      url: '/'
      views:
        menu:
          controller: 'MainController'
  .state
      name: 'main.list'
      url: 'list/:modelname'
      views:
        'list@':
          controller: 'ListController'
  .state
      name: 'main.model'
      url: 'model/:modelname/:id'
      views:
        'data@':
          controller: 'ModelController'


]