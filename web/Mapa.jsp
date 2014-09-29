<%-- 
    Document   : Mapa
    Created on : 28-sep-2014, 16:15:27
    Author     : Gerson pineda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta>
        <title>JSP Page</title>
    </head>
    <body>
        <input type ="button" onclick ="initialize()" value =" Mostrar Mapa">
        <div id="map" style ="width: 500px; height: 400px;"></div>
        <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
        <script>
               
                
        </script>
        <script type="text/javascript">
                      
            function initialize() {
                var imagen = new google.maps.MarkerImage(
                        'http://www.chistes-groseros.com/wp-content/uploads/2014/09/Borracho-50x50.gif',
                        new google.maps.Size(35, 40)
                        );
                var mapOptions = {
                    zoom: 7,
                    center: new google.maps.LatLng(15.7778663, -90.2287257),
                    mapTypeId: google.maps.MapTypeId.Satelite


                };

                var map = new google.maps.Map(document.getElementById('map'),
                        mapOptions);
                var Izabal = new google.maps.LatLng(15.5162829, -88.9285805);
                var Peten = new google.maps.LatLng(16.824146, -90.29163);

                var marcadorI = new google.maps.Marker({
                    position: Izabal,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorI, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorI.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: 'Hola, <div>¡estoy en Izabal!'
                    });
                    infowindow.open(map, marcadorI);
                });
                google.maps.event.addListener(Izabal, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(Izabal.getPosition());

                    }, 3000);
                });
                var marcadorP = new google.maps.Marker({
                    position: Peten,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });

                google.maps.event.addListener(marcadorP, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorP.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: 'Hola, <div>¡estoy en Peten!'
                    });
                    infowindow.open(map, marcadorP);

                });

                google.maps.event.addListener(Peten, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(Peten.getPosition());
                    }, 3000);
                });

            }

        </script>
    </body>
</html>