<%-- 
    Document   : SolicitudesRegistradas
    Created on : 02-oct-2014, 12:53:00
    Author     : cammend
--%>

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
<%@page import="clases.Piloto"%>
<%@page import="clases.SolicitudRegistrada"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbsql.DBio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes Registradas</title>
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
        <h1>Solicitudes Registradas</h1>
        <a href="/Angel2/org">Home</a>
        <br><br><br>
        <%
        DBio dbio = new DBio();
        ArrayList<SolicitudRegistrada> es = dbio.getSolicitudesResgistradas();
        ArrayList<Piloto> piloto = dbio.getPilotosDisponibles();
        if( es != null && piloto != null ){
            out.println("<table >");
            out.println("<tr>");
            out.println("<td>Codigo Solicitud</td>");
            out.println("<td>Nombre Ebrio</td>");
            out.println("<td>Nombre Encargado</td>");
            out.println("<td>Telefono Encargado</td>");
            out.println("<td>Fecha</td>");
            out.println("<td>Asignar Piloto</td>");
            out.println("</tr>");
            for(int i=0; i<es.size(); i++){
                out.println("<tr>");
                out.println("<td>");
                out.println(es.get(i).getCodigoSolicitud());
                out.println("</td>");
                out.println("<td>");
                out.println(es.get(i).getNombreEbrio());
                out.println("</td>");
                out.println("<td>");
                out.println(es.get(i).getNombreEncargado());
                out.println("</td>");
                out.println("<td>");
                out.println(es.get(i).getTelEncargado());
                out.println("</td>");
                out.println("<td>");
                out.println(es.get(i).getFecha());
                out.println("</td>");
                out.println("<td>");
                out.println("<form name=\"formulario\" action=\"pendientes/procesando\" method=\"post\">");
                out.println("<select name=\"piloto\" >");
                for(int j=0; j<piloto.size(); j++){
                    out.println("<option value=\""+piloto.get(j).getCodigoPiloto()+","+es.get(i).getCodigoSolicitud()+"\">");
                    out.println(piloto.get(j).getNombrePiloto());
                    out.println("</option>");
                }
                out.println("</select>");
                out.println("<input type=\"submit\" value=\"Procesar\" />");
                out.println("</form>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }else{
            out.println("<h2>No se encontraron solicitudes Registradas o no hay Pilotos Disponibles</h2>");
        }
        %>
    </body>
</html>
