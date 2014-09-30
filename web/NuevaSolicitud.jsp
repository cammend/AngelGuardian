<%-- 
    Document   : NuevaSolicitud
    Created on : 29-sep-2014, 18:51:36
    Author     : cammend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Solicitud</title>
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
        <h1><center>Nueva Solicitud</center></h1>
        
        <div id="formulario">
            <div id="f">
        <form method="post" action="registrando/solicitud" name="nueva-solicitud">
            <div name="datos-ebrio" class="div-form">
                <h3>Datos de Persona en Embriaguez:</h3>
                <label>DPI:</label>
                <input type="text" name="dpi" required />
                <label>Nombre:</label>
                <input type="text" name="nombreEb" required />
                <label>Apellido Paterno:</label>
                <input type="text" name="apellidop" required />
                <label>Apellido Materno:</label>
                <input type="text" name="apellidom" required />
            </div>
            <div name="datos-encargado" class="div-form">
                <h3>Datos de Persona Encargada:</h3>
                <label>Nombre:</label>
                <input type="text" name="nombreEn" required />
                <label>Apellidos:</label>
                <input type="text" name="apellidos" required />
                <label>Teléfono:</label>
                <input type="text" name="telefono" required />
            </div>
            <div class="div-form">
                <h3>Dirección de Destino:</h3>
                <label>Departamento:</label>
                <select name="departamento">
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
                <input type="text" name="municipio" required />
                <label>Barrio:</label>
                <input type="text" name="barrio" required />
                <br>
                <input type="submit" value="Registrar Solicitud" />
            </div>
        </form>
        </div>
    </div>
    </body>
</html>
