var customTreeController = ['$scope', '$log', '$window', '$http', 'HierarchySrv', function($scope, $log, $window, $http, HierarchySrv) {
            $scope.data = [];

            $scope.init = function() {
                var he_id = HierarchySrv.hierarchy;
                $scope.url = $window.getAjaxUrl(he_id, 0);
                $http({
                    cache: true,
                    method: 'GET',
                    url: $scope.url
                }).success(function(data){
                    $scope.data = data;
                }).error(function() {
                    $scope.data = [];
                });
            };

            $scope.getNodes = function(onlyParents) {
                var nodesArray = [];
                for (var dataItem in $scope.data) {
                    if ((parseInt($scope.data[dataItem].childrenCount) > 0 && onlyParents) ||
                        (parseInt($scope.data[dataItem].childrenCount) == 0 && !onlyParents)) {
                        nodesArray.push($scope.data[dataItem]);
                    }
                }
                return nodesArray;
            }

            $scope.getParents = function() {
                return $scope.getNodes(true);
            }

            $scope.getLeaf = function() {
                return $scope.getNodes(false);
            }
        }];
namesCtrl.directive("treeTag",['HierarchySrv', function (HierarchySrv) {
    return {
        restrict: 'E',
        scope: {},
        templateUrl: "Tree",
        link: function(scope, element, attrs) {
            scope.$on('changeHierarchy', function(event, data) {
               scope.init();
            });
        },
        controller: customTreeController
    };
}]);
