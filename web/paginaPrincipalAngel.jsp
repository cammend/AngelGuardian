<%-- 
    Document   : MainAngel
    Created on : 19-sep-2014, 17:49:34
    Author     : cammend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%
HttpSession sesion = request.getSession();
if( sesion.getAttribute("TipoSesion") != null ){
    if( session.getAttribute("TipoSesion").equals("UsuarioEntidad") ){
%>
        <jsp:forward page="/entidad" />
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
        <title>Angel Inc</title>
        <link rel="stylesheet" href="css/base.css">
        <link rel="stylesheet" href="css/angel.css">
    </head>
    
    <body>
        <header>
            <h1>Org. Ángel Guardián</h1>
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
                <a href="org/entidades/mas/activas">Entidades más activas</a>
                <a href="org/entidades/mapa">Ver mapa de Entidades</a>
                <a href="org/entidades">Ver todas las Entidades</a>
                <a href="org/solicitudes/pendientes">Ver solicitudes pendientes</a>
                <a href="org/solicitudes/eliminadas">Ver solicitudes eleminadas</a>
                <a href="org/usuarios">Ver usuarios</a>
            </h4>
        </div>
        
        <footer>
            Desarrollado por Cammend!<br>
            Sitio Web desarrollado en Java.
        </footer>
    </body>
</html>
