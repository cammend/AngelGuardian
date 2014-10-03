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
        
        <script>
            
            function validarZona() {
                var valor = document.getElementById("Zona").value;
                if (isNaN(valor)) {
                    alert("ingrese Numeros")
                    document.getElementById("Zona").focus();
                    return false;
                }
                return true;
            }
            
            
            
            
        </script>
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
            form{
                background: rgba(50,50,50,0.5);
                display: inline-block;
                width: 300px;
                border-radius: 5px;
                margin-top: 30px;
                padding-bottom: 15px;
            }

            #error{
                display: inline-block;
                text-align: center;
                border-color: red;
                border-style: solid;
                margin-top: 20px;
            }

            form label{
                display: inline-block;
                padding: 1px;
                width: 200px;
                font-size: 20px;
            }

            form input{
                font-size: 20px;
                display: inline-block;
                margin-top: 10px;
            }

            #formulario{
                text-align: center;
                display: block;
            }

            #f{
                display: block;
            }

            #div-form{
                display: block;
                background: blue;
                border-style: solid;
                border-color: white;
            }
        </style>
    </head>

    <body>
        <h1><center>Nueva Entidad</center></h1>



        <div id="formulario">
            <div id="f">

                <form action = "NuevaEntidad" method="post"  >  
                    <div name="NuevaEntidad" class="div-form">
                        <h3>Ingresar Datos de la entidad:</h3>
                        <label>Nombre de la entidad:</label>
                        <input type="text" name="Nombre" required placeholder="Escriba aqui el Nombre"/>
                        <label>Departamento:</label>
                        <select name="Departamento">
                            <option value="Alta Verapaz">Alta Verapaz</option>
                            <option value="Baja Verapaz">Baja Verapaz</option>
                            <option value="Chimaltenango">Chimaltenango</option>
                            <option value="Chiquimula">Chiquimula</option>
                            <option value="El Petén">El Petén</option>
                            <option value="El Progreso">El Progreso</option>
                            <option value="El Quiché">El Quiché</option>
                            <option value="Escuintla">Escuintla</option>
                            <option value="Guatemala">Guatemala</option>
                            <option value="Huehuetenango">Huehuetenango</option>
                            <option value="Izabal">Izabal</option>
                            <option value="Jalapa">Jalapa</option>
                            <option value="Jutiapa">Jutiapa</option>
                            <option value="Quetzaltenango">Quetzaltenango</option>
                            <option value="Retalhuleu">Retalhuleu</option>
                            <option value="Sacatepéquez">Sacatepéquez</option>
                            <option value="San Marcos">San Marcos</option>
                            <option value="Santa Rosa">Santa Rosa</option>
                            <option value="Sololá">Sololá</option>
                            <option value="Suchitepéquez">Suchitepéquez</option>
                            <option value="Totonicapan">Totonicapan</option>
                            <option value="Zacapa">Zacapa</option>
                        </select>

                        <label>Municipio:</label>
                        <input type="text" name="Municipio" required placeholder="Escriba aqui su Municipio"/>
                        <label>Zona:</label>
                        <input type="text" name="Zona" id="Zona" onblur="validarZona()" required placeholder="Escriba aqui su Zona"/>
                        <label>Colonia:</label>
                        <input type="text" name="Colonia" required placeholder="Escriba aqui su Colonia"/>
                        <label>Barrio:</label>
                        <input type="text" name="Barrio" required placeholder="Escriba aqui su Barrio" />
                        <label>Caserío:</label>
                        <input type="text" name="Cacerio"  required placeholder="Escriba aqui su Caserío" />

                        <input type="Submit" name="NuevaEntidad" /> 
                    </div> 

                </form> 

                <footer >
                    <br><br><br>
                    Desarrollado por Brandon!<br>
                    Sitio Web desarrollado en Java.
                </footer>
                </body>
                </html>
