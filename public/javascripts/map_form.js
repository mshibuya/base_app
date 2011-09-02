jQuery.fn.extend({
  mapForm:
  function(options){
    var settings = jQuery.extend({
      icon:   {
        url:    '/images/map/pointer.png',
        size:   new google.maps.Size(79,63),
        origin: new google.maps.Point(0,0),
        anchor: new google.maps.Point(39,63)
      },
      shadow: {
        url: '/images/map/shadow.png',
        size: new google.maps.Size(113,63)
      },
      latElem: 'input.lat',
      lngElem: 'input.lng',
      zoom:    10,
      draggable: true
    }, options);
    var latElement = this.find(settings.latElem), lngElement = this.find(settings.lngElem);
    var point = new google.maps.LatLng(latElement.val(), lngElement.val());
    var map = new google.maps.Map(this.find("div.map")[0], {
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      center: point,
      zoom: settings.zoom
    });
    if(settings.draggable){
      var icon = new google.maps.MarkerImage(settings.icon.url,
          settings.icon.size, settings.icon.origin, settings.icon.anchor);
      var shadow = new google.maps.MarkerImage(settings.shadow.url, settings.shadow.size);
      var marker = new google.maps.Marker({
        map:       map,
        draggable: true,
        position:  point,
        icon:      icon,
        shadow:    shadow
      });
      google.maps.event.addListener(marker, 'dragend', function(event){
        latElement.val(event.latLng.lat());
        lngElement.val(event.latLng.lng());
      });
    }else{
      var marker = new google.maps.Marker({
        map:       map,
        position:  point,
      });
    }
    
  }
});

