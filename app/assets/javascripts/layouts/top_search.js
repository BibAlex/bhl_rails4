topSearch = bhlApp.controller('topSearch', function($scope, $mdDialog, $mdMedia) {
  $scope.searchBy = 'title';
  $scope.search = function(ev) {
    if (!$scope.searchQuery) {
      $scope.customFullscreen = $mdMedia('xs') || $mdMedia('sm');
      $mdDialog.show(
          $mdDialog.alert()
              .clickOutsideToClose(true)
              .title('This is an alert title')
              .textContent('You can specify some description text in here.')
              .ariaLabel('Alert Dialog Demo')
              .ok('Got it!')
              .targetEvent(ev)
      );

      alert("#TODO: invalid search query");

    }
  };
});
