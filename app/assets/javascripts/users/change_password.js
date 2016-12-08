bhlApp.controller('userValidateChangePaaword',['$scope', '$window', function($scope, $window) {
    $scope.showErrors = false;
    $scope.validateForm = function(event, userForm) {
        if (userForm.$invalid) {
            $scope.showErrors = true;
            event.preventDefault();
        }       
    };   
}]);