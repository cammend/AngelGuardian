<%-- 
    Document   : paginaPrincipalEntidad
    Created on : 23/09/2014, 12:46:31 PM
    Author     : cammend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession sesion = request.getSession();
if( sesion.getAttribute("TipoSesion") != null ){
    if( session.getAttribute("TipoSesion").equals("UsuarioAngel") ){
%>
        <jsp:forward page="/org" />
<%
    }
}else{
%>
     <jsp:forward page="/login" />
<%
}
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/angel.css">        
    </head>
    <body>
        <header>
            <%
            out.print("<h1>");
            out.print(request.getSession().getAttribute("NombreEntidad"));
            out.print("</h1>");
            %>
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="Contacto.jsp">Contacto</a></li>
                    <li><a href="logout">Cerrar Sesión</a></li>
                </ul>
            </nav>
            <%//esto es para mostrar el nombre de usuario y tipo de usuario
            out.print("<h3 id=\"eslogan\">");
            out.print((String)request.getSession().getAttribute("nombre"));
            out.print(" : ");
            out.print((String)request.getSession().getAttribute("TipoUsuario"));
            out.print("</h3>");
            %>
        </header>
        
        <div id="navegacion">
            <h3>Navegación</h3>
            <h4>
                <a href="entidades/mas/activas">Entidades más activas</a>
                <a href="entidades/mapa">Ver mapa de Entidades</a>
                <a href="entidades">Ver todas las Entidades</a>
                <a href="solicitudes/pendientes">Ver solicitudes pendientes</a>
                <a href="solicitudes/eliminadas">Ver solicitudes eleminadas</a>
                <a href="entidades/mapa">Ver usuarios</a>
            </h4>
        </div>
        
        <footer>
            Desarrollado por Cammend!<br>
            Sitio Web desarrollado en Java.
        </footer>
    </body>
</html>
