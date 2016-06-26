describe("GoogleMap", function()
{
	beforeEach(module('bhlApp'));
	
	var GoogleMap;
	var mapOptions = {
    	zoom: 2,
        center: {lat: 30.064742, lng: 31.249509},
        mapTypeId: google.maps.MapTypeId.TERRAIN
    	};
    var element = '<div id="map"></div>';
	
	beforeEach(inject(function (_GoogleMap_) {
    	GoogleMap = _GoogleMap_;
  	}));
  	
	it('creates google map object with valid html div', function()
	{
		expect(new GoogleMap(element)).toBeDefined();
	});	
	
});


describe('MapCtrl', function () {

  var GoogleMap, controller, scope;
  var html = '<div id="map"></div>';        
        
  beforeEach(module('bhlApp'));
  beforeEach(inject(function (_GoogleMap_, $controller, $rootScope) {
  	angular.element(document.body).append(html);
    GoogleMap = _GoogleMap_;
    scope = $rootScope.$new();
    controller = $controller('MapCtrl', {
      $scope: scope
    });
  }));

  it('assigns a GoogleMap to the controller', function () {
    expect(controller.googleMapObject).to.be.an.instanceOf(GoogleMap);
  });

  // it('assigns a person to the scope', function () {
    // expect(scope.person).to.be.an.instanceOf(Person);
  // });

});
