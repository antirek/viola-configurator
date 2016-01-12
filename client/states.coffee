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
          templateUrl: '/parts/menu'
  .state
      name: 'main.models'
      url: ':modelname'
      views:
        'list@':
          controller: 'ListController'
          templateUrl: '/parts/modelsList'
  .state
      name: 'main.models.view'
      url: '/view/:id'
      views:
        'data@':
          controller: 'ModelController'
          templateUrl: '/parts/model'
  .state
      name: 'main.models.new'
      url: '/new'
      views:
        'data@':
          controller: 'ModelController'
          templateUrl: '/parts/model'
  .state
      name: 'main.files'
      url: 'files/save'
      views:
        'list@':
          controller: 'FilesController'
          templateUrl: '/parts/files'
]