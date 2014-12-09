angular.module("app.controllers").controller "UserRegistrationsCtrl", [
  "$scope"
  "$location"
  "$auth"
  ($scope, $location, $auth) ->
    $scope.$on "auth:registration-email-error", (ev, reason) ->
      $scope.error = reason.errors[0]
      return

    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm).then ->
        $auth.submitLogin
          email: $scope.registrationForm.email
          password: $scope.registrationForm.password
]


