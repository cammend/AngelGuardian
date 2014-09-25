<%-- 
    Document   : InicioSesion
    Created on : 17-sep-2014, 12:31:49
    Author     : cammend
--%>

<%@page import="cripto.md5"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/form.css">
    </head>
    <body>
        <header>
            <h1>Inicio de Sesión</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="Contacto.jsp">Contacto</a></li>
                </ul>
            </nav>
        </header>
        <div id="formulario">
            <%
            HttpSession sesion = request.getSession();

            if( sesion.getAttribute("error") != null ){
                out.println("<p id=\"error\">"+sesion.getAttribute("error")+"</p>");
            }
            %>
            <div id="f">
            <form id="iniciosesion" method="post" action="comprobando/login">
                <label>Nombre de Usuario:</label>
                <input name="nombre" type="text" required/>

                <label>Contraseña:</label>
                <input name="pass" type="password" required/>

                <input type="submit" value="Iniciar" />
            </form>
            </div>  
        </div>
            
        <footer>
            Desarrollado por Cammend!<br>
            Sitio Web desarrollado en Java.
        </footer>
    </body>
</html>
