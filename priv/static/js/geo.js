function success(position) {
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'leftmapcontainer';
  mapcanvas.style.height = '420px';
  mapcanvas.style.width = '420px';
  
  document.querySelector('article').appendChild(mapcanvas);

  var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  
  var options = {
    zoom: 11,
    center: coords,
    mapTypeControl: false,
    navigationControlOptions: {
    	style: google.maps.NavigationControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("leftmapcontainer"), options);

  //var marker = new google.maps.Marker({
      //position: coords,
      //map: map,
      //title:"You are here!"
  //});
}

function success2(position) {
  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'rightmapcontainer';
  mapcanvas.style.height = '420px';
  mapcanvas.style.width = '420px';
  
  document.querySelector('article').appendChild(mapcanvas);

  var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  
  var options = {
    zoom: 11,
    center: coords,
    mapTypeControl: false,
    navigationControlOptions: {
    	style: google.maps.NavigationControlStyle.SMALL
    },
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("rightmapcontainer"), options);

  //var marker = new google.maps.Marker({
      //position: coords,
      //map: map,
      //title:"You are here!"
  //});
}

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(success2);
  navigator.geolocation.getCurrentPosition(success);
} else {
  error('Geo Location is not supported');
}
