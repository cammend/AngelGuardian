<%-- 
    Document   : SolicitudesPendientes
    Created on : 26-sep-2014, 0:18:09
    Author     : cammend
--%>

<%@page import="dbsql.DBio"%>
<%@page import="clases.Solicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes Pendientes</title>
        <link rel="stylesheet" href="css/tabla.css">
        <style>
            body{
                background: rgb(233,233,233);
                font-size: 16px;
            }
            table{
                border: solid;
            }
            td{
                border: solid;
                padding: 2px;
            }
        </style>
        
    </head>
    <body>
        <h1>Solicitudes Pendientes</h1>
        <%
        DBio dbio = new DBio();
        ArrayList<Solicitud> solicitudes = (ArrayList)dbio.getSolicitudesPendientes();
        if( solicitudes != null ){
            out.print("<table >");
            out.print("<tr>");
            out.print("<td>Cod. Solicitud</td>");
            out.print("<td>Entidad</td>");
            out.print("<td>Usuario Entidad</td>");
            out.print("<td>Piloto</td>");
            out.print("<td>Ebrio</td>");
            out.print("<td>Fecha</td>");
            out.print("</tr>");
            for(int i=0; i<solicitudes.size(); i++){
                out.print("<tr>");
                out.print("<td>");
                out.print(solicitudes.get(i).getCodigo());
                out.print("</td>");
                out.print("<td>");
                out.print(solicitudes.get(i).getNombreEntidad());
                out.print("</td>");
                out.print("<td>");
                out.print(solicitudes.get(i).getNombreUsuario());
                out.print("</td>");
                out.print("<td>");
                out.print(solicitudes.get(i).getNombrePiloto());
                out.print("</td>");
                out.print("<td>");
                out.print(solicitudes.get(i).getNombreEbrio());
                out.print("</td>");
                out.print("<td>");
                out.print(solicitudes.get(i).getFecha());
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        }
        %>
    </body>
</html>
