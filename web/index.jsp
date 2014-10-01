<%-- 
    Document   : index
    Created on : 17-sep-2014, 11:33:57
    Author     : cammend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ángel Guardián</title>
        <link rel="stylesheet" href="css/base.css">
    </head>
    <body>
        <header>
            <h1>Ángel Guardián</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <%
                    if( request.getSession().getAttribute("TipoSesion") != null ){
                        if ( request.getSession().getAttribute("NombreEntidad") != null ){
                            out.print("<li><a href=\"entidad\">Principal</a></li>");
                        }else{
                            out.print("<li><a href=\"org\">Principal</a></li>");
                        }
                    }
                    %>
                    <li><a href="contacto">Contacto</a></li>
                    <%
                    if( request.getSession().getAttribute("TipoSesion") == null ){
                        out.print("<li><a href=\"login\">Iniciar Sesión</a></li>");
                    }else{
                        out.print("<li><a href=\"logout\">Cerrar Sesión</a></li>");
                    }
                    %>
                    
                </ul>
            </nav>
        </header>
        
        <p>
           Bienvenidos a la Organización Ángel Guardián que 
           está destinada a resguardar la vida de las personas que corren riesgo de sufrir
           accidentes automovilísticos a causa del alcohol.
        </p>
        <p>
           Estamos ahí como un ángel guardián!
        </p>
        
        <footer>
            Desarrollado por Cammend!<br>
            Sitio Web desarrollado en Java.
        </footer>
    </body>
</html>
