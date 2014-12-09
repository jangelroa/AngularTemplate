angular.module("app.controllers").controller "UserSessionsCtrl", [
  "$scope"
  ($scope) ->

    $scope.$on "auth:login-error", (ev, reason) ->
      $scope.error = reason.errors[0]

]