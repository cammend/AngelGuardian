<%-- 
    Document   : NuevaSolicitud
    Created on : 25/09/2014, 08:19:19 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
         <form action = "NuevoAngel" method="post">  
            <table >
                <tr >
                     <h1>Bienvenido! Ingrese Una Nuevo Usuario Angel </h1>   </td> 
                </tr>
                                                
                 <tr aling="left" ><td>DPI</td>
                    <td><input type="text" name="DPI"></td>
                </tr>
                          
                <tr aling="left" ><td>Nombre</td>
                    <td><input type="text" name="Nombre"></td>
                </tr>
                
                <tr aling="left" ><td>Apellido Paterno</td>
                    <td><input type="text" name="ApellidoP"></td>
                </tr>
                
                <tr aling="left" ><td>Apellido Materno</td>
                    <td><input type="text" name="ApellidoM"></td>
                </tr>
                
                <tr aling="left" ><td>Genero</td>
                    <td><input type="text" name="ApellidoP"></td>
                </tr>
                                          
                 <tr aling="left" ><td>Alias</td>
                    <td><input type="text" name="Alias"></td>
                </tr>
                
                 <tr aling="left" ><td>Password</td>
                    <td><input type="text" name="Password"></td>
                </tr>
                
                 <tr aling="left" ><td>Celular</td>
                    <td><input type="text" name="Celular"></td>
                     </tr>
                     
                     <tr aling="left" ><td>Domicilio</td>
                    <td><input type="text" name="Domicilio"></td>
                </tr> 
                     
                
                  <tr aling="left" ><td>Tipo de Usuario</td>            
                <select aling="left" name="TipoUser">
                    <option>Admin</option>
                    <option>Normal</option>
                </select>
                
                    <tr aling="left" ><td>ingresar</td>
                    <td><input type="submit" value="ingresar" name="NuevoAngel"></td>
                    
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
