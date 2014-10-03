<%-- 
    Document   : Mapa
    Created on : 28-sep-2014, 16:15:27
    Author     : Gerson pineda
--%>

<%@page import="clases.EntidadDepartamento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="clases.Leer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="map" style ="width: 500px; height: 400px;"></div>
        <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
        
        <script type="text/javascript">
            var AltaVerapazi = "0";
            var BajaVerapazi = "0";
            var Chimaltenangoi = "0";
            var Chiquimulai ="0";
            var Peteni = "0";
            var ElProgresoi = "0";
            var Quichei = "0";
            var Escuintlai = "0";
            var Guatemalai = "0";
            var Huehuetenangoi ="0";
            var Izabali = "0";
            var Jalapai = "0";
            var Jutiapai = "0";
            var Quetzaltenangoi = "0";
            var Retalhuleui = "0";
            var Sacatepequezi = "0";
            var SanMarcosi = "0";
            var SataRosai = "0";
            var Sololai = "0";
            var Suchitepequezi = "0";
            var Totonicapani = "0";
            var Zacapai = "0";
            <%
            //aca llamas a tus métodos para leer info de la db. (Ejemplo)
            //la variable info existe en javascript y observá como le doy un valor
            //esto se hace con java.
            //la linea de abajo pone sol siguiente: info = "Hola estoy en peten...!"
            Leer a = new Leer();
            ArrayList<EntidadDepartamento> ed = new ArrayList();
            ed = a.procesarMapa();
            
            for( int i=0; i<ed.size(); i++ ){
                String variable = ed.get(i).getDepartamento().trim()+"i";
                out.println(variable+"=\""+ed.get(i).getNumero()+"\"");
                JOptionPane.showMessageDialog(null,variable+"=\""+ed.get(i).getNumero()+"\"");
            }
            //JOptionPane.showMessageDialog(null,inf);
            //out.print(" info = \""+inf+"\""); //Este es un ejemplo sin llamar a un método.
            %>
                     
            //cargar el metodo initialize al cargar la página!
            window.onload = function(){
                initialize();
            }
            
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
                        content: Izabali
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
                        content: Peteni
                    });
                    infowindow.open(map, marcadorP);

                });

                google.maps.event.addListener(Peten, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(Peten.getPosition());
                    }, 3000);
                });
                
                var Quetzaltenango = new google.maps.LatLng(14.8374836,-91.5234518);
               

                var marcadorquet = new google.maps.Marker({
                    
		position: Quetzaltenango,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorquet, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorquet.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Quetzaltenangoi
                        });
                    infowindow.open(map, marcadorquet);

                });

                google.maps.event.addListener(Quetzaltenango, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(Quetzaltenango.getPosition());
                    }, 3000);
                });
                        
                        
                var Retal = new google.maps.LatLng(14.4272064,-91.8335454);
               

                var marcadorret = new google.maps.Marker({
                    
		position: Retal,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorret, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorret.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Retalhuleui
                        });
                    infowindow.open(map, marcadorret);

                });

                google.maps.event.addListener(Retal, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(Retal.getPosition());
                    }, 3000);
                });
                        
                        
                        
                var huehue = new google.maps.LatLng(15.3176915,-91.4915228);
               

                var marcadorhue = new google.maps.Marker({
                    
		position: huehue,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorhue, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorhue.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Huehuetenangoi
                        });
                    infowindow.open(map, marcadorhue);

                });

                google.maps.event.addListener(huehue, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(huehue.getPosition());
                    }, 3000);
                });
                        
                        
                        
                var quiche = new google.maps.LatLng(15.4359529,-90.8681509);
               

                var marcadorqui = new google.maps.Marker({
                    
		position: quiche,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorqui, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorqui.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Quichei
                        });
                    infowindow.open(map, marcadorqui);

                });

                google.maps.event.addListener(quiche, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(quiche.getPosition());
                    }, 3000);
                });
                
                var alta = new google.maps.LatLng(15.604631,-90.0853444);
               

                var marcadoralta = new google.maps.Marker({
                    
		position: alta,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadoralta, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadoralta.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: AltaVerapazi
});
                    infowindow.open(map, marcadoralta);
                });
                google.maps.event.addListener(alta, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(alta.getPosition());

                    }, 3000);
});

var baja = new google.maps.LatLng(15.074285,-90.377131);
               

                var marcadorbaja = new google.maps.Marker({
                    
		position:baja,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorbaja, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorbaja.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: BajaVerapazi
});
                    infowindow.open(map, marcadorbaja);
                });
                google.maps.event.addListener(baja, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(baja.getPosition());

                    }, 3000);
});


var marcos = new google.maps.LatLng(14.9638569,-91.8013394);
               

                var marcadormarcos = new google.maps.Marker({
                    
		position:marcos,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadormarcos, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadormarcos.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: SanMarcosi
});
                    infowindow.open(map, marcadormarcos);
                });
                google.maps.event.addListener(marcos, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(marcos.getPosition());

                    }, 3000);
});

var toto = new google.maps.LatLng(14.9133942,-91.3605452);
               

                var marcadortoto = new google.maps.Marker({
                    
		position:toto,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadortoto, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadortoto.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Totonicapani
});
                    infowindow.open(map, marcadortoto);
                });
                google.maps.event.addListener(toto, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(toto.getPosition());

                    }, 3000);
});

var toto = new google.maps.LatLng(14.9133942,-91.3605452);
               

                var marcadortoto = new google.maps.Marker({
                    
		position:toto,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadortoto, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadortoto.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Totonicapani
});
                    infowindow.open(map, marcadortoto);
                });
                google.maps.event.addListener(toto, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(toto.getPosition());

                    }, 3000);
});

var sol = new google.maps.LatLng(14.7124505,-91.2610815);
               

                var marcadorsol = new google.maps.Marker({
                    
		position:sol,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorsol, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorsol.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Sololai
});
                    infowindow.open(map, marcadorsol);
                });
                google.maps.event.addListener(sol, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(sol.getPosition());

                    }, 3000);
});

var chima = new google.maps.LatLng(14.6508176,-90.8714286);
               

                var marcadorchima = new google.maps.Marker({
                    
		position:chima,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorchima, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorchima.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Chimaltenangoi
});
                    infowindow.open(map, marcadorchima);
                });
                google.maps.event.addListener(chima, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(chima.getPosition());

                    }, 3000);
});

var saca = new google.maps.LatLng(14.5828644,-90.736859);
               

                var marcadorsaca = new google.maps.Marker({
                    
		position:saca,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorsaca, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorsaca.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Sacatepequezi
});
                    infowindow.open(map, marcadorsaca);
                });
                google.maps.event.addListener(saca, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(saca.getPosition());

                    }, 3000);
});

var guate = new google.maps.LatLng(14.62622,-90.4919387);
               

                var marcadorguate = new google.maps.Marker({
                    
		position:guate,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorguate, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorguate.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Guatemalai
});
                    infowindow.open(map, marcadorguate);
                });
                google.maps.event.addListener(guate, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(guate.getPosition());

                    }, 3000);
                });
                

var pro = new google.maps.LatLng(14.9051264,-90.061753);
               

                var marcadorpro = new google.maps.Marker({
                    
		position:pro,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorpro, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorpro.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: ElProgresoi
});
                    infowindow.open(map, marcadorpro);
                });
                google.maps.event.addListener(pro, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(pro.getPosition());

                    }, 3000);
                });
                
                var jal = new google.maps.LatLng(14.6429284,-89.943271);
               

                var marcadorjal = new google.maps.Marker({
                    
		position:jal,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorjal, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorjal.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Jalapai
});
                    infowindow.open(map, marcadorjal);
                });
                google.maps.event.addListener(jal, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(jal.getPosition());

                    }, 3000);
                });
                
                var zaca = new google.maps.LatLng(15.035154,-89.489515);
               

                var marcadorzaca = new google.maps.Marker({
                    
		position:zaca,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorzaca, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorzaca.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Zacapai
});
                    infowindow.open(map, marcadorzaca);
                });
                google.maps.event.addListener(zaca, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(zaca.getPosition());

                    }, 3000);
                });
                
                var suchi = new google.maps.LatLng(14.3888715,-91.3708516);
               

                var marcadorsuchi = new google.maps.Marker({
                    
		position:suchi,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorsuchi, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorsuchi.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Suchitepequez
});
                    infowindow.open(map, marcadorsuchi);
                });
                google.maps.event.addListener(suchi, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(suchi.getPosition());

                    }, 3000);
                });
                
                var esc = new google.maps.LatLng(14.1933015,-91.015127);
               

                var marcadoresc = new google.maps.Marker({
                    
		position:esc,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadoresc, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadoresc.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Escuintlai
});
                    infowindow.open(map, marcadoresc);
                });
                google.maps.event.addListener(esc, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(esc.getPosition());

                    }, 3000);
                });
                
                var santa = new google.maps.LatLng(14.1406091,-90.3115375);
               

                var marcadorsanta = new google.maps.Marker({
                    
		position:santa,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorsanta, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorsanta.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: SantaRosai
                });
                    infowindow.open(map, marcadorsanta);
                });
                google.maps.event.addListener(santa, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(santa.getPosition());

                    }, 3000);
                });
                
                var jut = new google.maps.LatLng(14.153646,-89.8547309);
               

                var marcadorjut = new google.maps.Marker({
                    
		position:jut,
                    map: map,
                    title: 'Click para Acercar',
                    icon: imagen
                });
                google.maps.event.addListener(marcadorjut, 'click', function() {
                    map.setZoom(7);
                    map.setCenter(marcadorjut.getPosition());
                    var infowindow = new google.maps.InfoWindow({
                        content: Jutiapai
                   });
                    infowindow.open(map, marcadorjut);
                });
                google.maps.event.addListener(jut, 'center_changed', function() {
                    window.setTimeout(function() {
                        map.panTo(jut.getPosition());

                    }, 3000);
                });

            }
        </script>
    </body>
</html>
