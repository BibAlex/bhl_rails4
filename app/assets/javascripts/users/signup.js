bhlApp.controller("signupValidate", function($scope, $window, $log) {
    $scope.showErrors = false;
    $scope.recaptchaError = false;
    $scope.signupValidate = function(event, signupForm) {
        if (signupForm.$invalid) {
            $scope.showErrors = true;
            event.preventDefault();
        }
        if (grecaptcha.getResponse() != undefined && (grecaptcha.getResponse() == null) || (grecaptcha.getResponse() == '')) {
            $scope.showErrors = true;
            $scope.recaptchaError = $window.recaptchaError = true;
            event.preventDefault();
        }
    };
});

function recaptchaCallback() {
    var appElement = document.querySelector('[ng-app=loginApp]');
    var $scope = angular.element(appElement).scope().$$childHead;
    $scope.$apply(function() {
        $scope.recaptchaError = false;
    });
};