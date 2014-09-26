<%-- 
    Document   : newjsp
    Created on : 26-sep-2014, 3:27:46
    Author     : cammend
--%>

<%@page import="clases.EntidadSolicitud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbsql.DBio"%>
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
        <title>Top 5</title>
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
        <h1>Top 5 de entidades más atendidas</h1>
        <%
        DBio dbio = new DBio();
        ArrayList<EntidadSolicitud> es = dbio.procesarTop5();
        if( es != null ){
            out.print("<table >");
            out.print("<tr>");
            out.print("<td>Nombre</td>");
            out.print("<td># Solicitudes</td>");
            out.print("</tr>");
            for(int i=0; i<es.size(); i++){
                out.print("<tr>");
                out.print("<td>");
                out.print(es.get(i).getCodEntidad());
                out.print("</td>");
                out.print("<td>");
                out.print(es.get(i).getNumSol());
                out.print("</td>");
                out.print("</tr>");
            }
            out.print("</table>");
        }
        %>
    </body>
</html>
