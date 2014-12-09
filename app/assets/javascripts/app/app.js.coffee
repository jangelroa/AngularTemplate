angular.module "app.controllers", []
angular.module "app.factories", []

app = angular.module("app", [
  "rails"
  "app.controllers"
  "app.factories"
  "ngRoute"
])

app.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode
    enabled: true
    requireBase: false

  $routeProvider.when("/",
    templateUrl: "/templates/main.html"
    controller: "IndexCtrl"
  ).when("/about",
    templateUrl: "/templates/about.html"
    controller: "AboutCtrl"
  ).otherwise redirectTo: "/"
  return