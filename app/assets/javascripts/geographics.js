bhlApp.factory("GoogleMap",['$http', function($http)
{
	var GoogleMap = function(element)
	{
    	var map;
	    var infoWindow;
	    var markers;
    	
		this.initialize = function(ele)
		{
			var mapOptions = {
        		zoom: 2,
        		center: {lat: 30.064742, lng: 31.249509},
        		mapTypeId: google.maps.MapTypeId.TERRAIN
    		};
	    	map = new google.maps.Map(ele, mapOptions);
	    	infoWindow = new google.maps.InfoWindow();
	    	markers = [];
		};
		
		this.removeSelectedPins = function(pinCategory)
	    {
	    	angular.forEach(markers, function(marker)
	    	{
	    		if (marker.category == pinCategory) {
	    			marker.setMap(null);
	    		};	    		
	    	});
	    };
		
		this.fillMapWithMarkers = function(pinCategory)
	    {
	    	var url;
	    	if (pinCategory) 
	    	{
	    		url = "/geographics/load_books/" + pinCategory;
	    	}
	    	else
	    	{
	    		url = "/geographics/load_books";
	    	}
	    	$http.get(url).success( function(response) {
	    		angular.forEach(response, function(bookInfo)
	    		{
	    			createMarker(bookInfo);
	    		});	
	        });    	
	    };
	    
	    function createMarker(info){        
	    	var marker = new google.maps.Marker({
	            map: map,
	            position: new google.maps.LatLng(info.latitude, info.longitude),
	            icon: info.icon,
	            category: info.category
	        });
	        
	        google.maps.event.addListener(marker, 'click', function(){
	        	$http.get("/geographics/show/" + info.address).success( function(response) {
	        		infoWindow.setContent(response);
	            	infoWindow.open(map, marker);		
	        	});            
	        });	        
	        markers.push(marker);	        
	    }
	    this.initialize(element);	
	};
	return GoogleMap;
}]);




bhlApp.controller('MapCtrl',['$scope','GoogleMap', function ($scope, GoogleMap) {	
	
	var googleMapObject;
    $scope.updatePins = function(pinCategory)
    {
    	var field = "check_" + pinCategory;
    	if ($scope[field]) {
    		googleMapObject.fillMapWithMarkers(pinCategory);
    	}
    	else
    	{
    		googleMapObject.removeSelectedPins(pinCategory);
    	}
    	
    };   
    
    $scope.setSelectPins = function()
	{
		$scope.check_100 = true;
    	$scope.check_200 = true;
    	$scope.check_300 = true;
    	$scope.check_400 = true;
    	$scope.check_500 = true;
    	googleMapObject = new GoogleMap(document.getElementById('map'));
    	googleMapObject.fillMapWithMarkers();   	
	};
}]);


