var customController = ['$scope', '$log', '$window', '$http', 'HierarchySrv', '$mdDialog', '$mdMedia', function ($scope, $log, $window, $http, HierarchySrv, $mdDialog, $mdMedia) {
            $scope.isParent = function() {
                if (typeof $scope.childrenCount == undefined)
                    return false;
                else
                    return(parseInt($scope.childrenCount) > 0);
            };

            $scope.toggleNode = function () {
                if ($scope.isParent()) {
                    if ($scope.isClosed) {
                        $scope.isClosed = false;
                        $scope.nodeIcon = $window.openIcon;
                        $scope.isLoading = true;
                        $scope.expand();
                    } else {
                        $scope.isClosed = true;
                        $scope.nodeIcon = $window.closedIcon;
                        $scope.collapse();
                    }
                }
            };

            $scope.expand = function() {
                var he_id = HierarchySrv.hierarchy;
                $scope.url = $window.getAjaxUrl(he_id, $scope.id);
                $http({
                    cache: true,
                    method: 'GET',
                    url: $scope.url
                }).success(function(data){
                    $scope.data = data;
                    $scope.showChildren = true;
                    $scope.isLoading = false;
                }).error(function() {
                    $scope.data = [];
                });
            };

            $scope.collapse = function() {
                $scope.isLoading = false;
                $scope.showChildren = false;
            };

            $scope.loadDetails = function(ev){
                var useFullScreen = ($mdMedia('sm') || $mdMedia('xs'));
                $mdDialog.show({
                    templateUrl: '/names/get_content/' + $scope.id,
                    parent: angular.element(document.body),
                    targetEvent: ev,
                    clickOutsideToClose:true,
                    fullscreen: useFullScreen
                });
            };

            // TODO: needs to have controller.init
            if ($scope.isParent())
                $scope.nodeIcon = $window.closedIcon;
            else
                $scope.nodeIcon = $window.nodeIcon;
            $scope.isClosed = true;
            $scope.isLoading = false;
            $scope.showChildren = false;
        }];



namesCtrl.directive("nodeTag",['HierarchySrv', function(HierarchySrv) {
    return {
        restrict: 'E',
        scope: {
            id: '@',
            name: '@',
            childrenCount: '@',
            taxonConceptId: '@'
        },
        templateUrl: 'Node',
        controller: customController
    }
}]);
