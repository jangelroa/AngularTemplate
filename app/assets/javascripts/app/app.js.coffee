angular.module "app.controllers", []
angular.module "app.factories", []

app = angular.module("app", [
  "rails"
  "app.controllers"
  "app.factories"
  "ngRoute"
  'ipCookie'
  "ng-token-auth"
])

app.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

app.run [
  "$rootScope"
  "$location"
  ($rootScope, $location) ->
    $rootScope.$on "auth:login-success", ->
      $location.path "/home"
    $rootScope.$on "auth:logout-success", ->
      $location.path "/"
]

app.directive "autofocus", [
  "$timeout"
  ($timeout) ->
    (
      restrict: "A"
      link: ($scope, $element) ->
        $timeout ->
          $element[0].focus()
    )
]


app.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode
    enabled: true
    requireBase: false

  $routeProvider.when("/",
    templateUrl: "/templates/main.html"
    controller: "IndexCtrl"
  ).when("/sign_in",
    templateUrl: "/templates/user_sessions/new.html"
    controller: "UserSessionsCtrl"
  ).when("/sign_up",
    templateUrl: "/templates/user_registrations/new.html"
    controller: "UserRegistrationsCtrl"
  ).when("/home",
    templateUrl: "/templates/home.html"
    controller: "HomeCtrl"
    resolve:
      auth:[
        "$auth"
        ($auth) ->
          $auth.validateUser()

        ]
  ).otherwise redirectTo: "/"
