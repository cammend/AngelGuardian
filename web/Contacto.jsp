<%-- 
    Document   : Contacto
    Created on : 17-sep-2014, 11:59:06
    Author     : cammend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contácto</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/contacto.css">
    </head>
    <body>
        <header>
            <h1>Contáctenos!</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                </ul>
            </nav>
        </header>
        
        <div id="telefonos">
            <h3>
                Teléfonos:
            </h3>
            <h4>
                5026 0479<br>
                5045 1090
            </h4>
        </div>
        
        <div id="mensaje">
            <h3>Escríbanos!</h3>
            <form id="formulario" method="post" action="enviar/mensaje">
                <label>Nombre Empresa:</label>
                <input type="text" name="empresa" required/>
                <label>Correo:</label>
                <input type="text" name="correo" required/>
                <textarea rows="10" cols="50" name="mensaje" required/></textarea>
                <div id="cont-env"><input id="env" type="submit" value="Enviar"/></div>
            </form>
        </div>
            
        <footer>
            Desarrollado por Cammend!<br>
            Sitio Web desarrollado en Java.
        </footer>
    </body>
</html>
