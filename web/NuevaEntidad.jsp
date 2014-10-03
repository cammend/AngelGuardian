<%-- 
    Document   : NuevaEntidad
    Created on : 24/09/2014, 05:01:06 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>

    </head>
    <body>
        <form action = "NuevaEntidad/procesando" method="post">  
            <table >
                <tr >
                     <h1>Bienvenido! Ingrese entidad </h1>   </td> 
                </tr>
                
                <tr aling="left" ><td>Nombre</td>
                    <td><input type="text" name="Nombre"></td>
                </tr>
                
                
                
                <tr aling="left" ><td>Departamento</td>
                    <td><input type="text" name="Departamento"></td>
                </tr>
                
                 <tr aling="left" ><td>Municipio</td>
                    <td><input type="text" name="Municipio"></td>
                </tr>
                
                 <tr aling="left" ><td>Colonia</td>
                    <td><input type="text" name="Colonia"></td>
                </tr>
                
                 <tr aling="left" ><td>Barrio</td>
                    <td><input type="text" name="Barrio"></td>
                </tr>
                
                <tr aling="left" ><td>Cacerío</td>
                    <td><input type="text" name="Cacerio"></td>
                </tr>
                
                
                 <tr aling="left" ><td>ingresar</td>
                    <td><input type="submit" value="ingresar" name="NuevaEntidad"></td>
                    
                </tr>
                
                
            </table>
         
        </form> 
        
         <footer >
             <br><br><br><br><br><br>
            Desarrollado por Brandon!<br>
            Sitio Web desarrollado en Java.
        </footer>
    </body>
</html>
