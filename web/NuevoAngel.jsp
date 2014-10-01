<%-- 
    Document   : NuevaSolicitud
    Created on : 25/09/2014, 08:19:19 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//este codigo es para que solo se acceda a esta pagina si ya se coloco el user y pass
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
        <title>JSP Page</title>
       
        <script >
            
        function validacion(){
            var Password = document.getElementById("Password").value;
            var Pass = document.getElementById("Pass").value;
            
            if(Password == Pass){
                alert("Contraseñas coinciden");
               
            }else{
                alert("Contraseñas no coinciden");
                document.getElementById("Password").focus();
                return false;
             }  
             return true;
        } 
        
        function validarNum(){
       var valor = document.getElementById("Celular").value;
         if( !(/^\d{8}$/.test(valor)) ) {
             alert("Numero Invalido");
             document.getElementById("Celular").focus();
           return false;
         }
       return true; 
       } 
       
        function validarDom(){
       var valor = document.getElementById("Domicilio").value;
         if( !(/^\d{8}$/.test(valor)) ) {
             alert("Numero Invalido");
             document.getElementById("Domicilio").focus();
           return false;
         }
         return true; 
       } 
       
        function validarDpi(){
       var valor = document.getElementById("DPI").value;
         if( !(/^\d{8}$/.test(valor)) ) {
             alert("Numero Invalido");
             document.getElementById("DPI").focus();
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
        
        <%
        //aca donde dice action pones la direccion de la pagina que va a procesar 
        //los datos llegados del formulario y los va a ingresar a la base de datos!.
        //entonces le voy a poner la direccion /org/user/nuevo/procesando pa que se vea bonito, jaja
        //pero esta pagina no existe!!, por eso es necesaria mapear esta direccion hacia
        //tu servlet que procesa la info. este mapeo se hace en el archivo web.xml o
        //directamente en el servlet. en este caso como lo tenes en tu servlet lo voy
        //a modificar ahi.
        %>
         <h1><center>Nuevo Angel</center></h1>
        
        <div id="formulario">
            <div id="f">
        
        <form action = "nuevo/procesando" method="post"  >  
         <div name="DatosAngel" class="div-form">
                <h3>Ingresar Datos del Usuario:</h3>
                <label>DPI:</label>
                <input type="text" name="DPI" id="DPI"  required placeholder="Escriba aqui su Dpi"/>
                <label>Nombre:</label>
                <input type="text" name="Nombre" required onClick="validarDpi()"  placeholder="Escriba aqui su Nombre"/>
                <label>Apellido Paterno:</label>
                <input type="text" name=ApellidoP" required placeholder="Escriba aqui su ApellidoP"/>
                <label>Apellido Materno:</label>
                <input type="text" name="ApellidoM" required placeholder="Escriba aqui su ApellidoM"/>
                <label>Genero:</label>
                <input type="text" name="Genero" required placeholder="Escriba aqui su Genero"/>
                <label>Alias:</label>
                <input type="text" name="Alias" required placeholder="Escriba aqui su Alias" />
                <label>Password:</label>
                <input type="Password" name="Password" id="Password" required placeholder="Escriba aqui su Pass" />
                <label>Repita su Password:</label>
                <input type="Password" name="Pass" id="Pass" required placeholder="Escriba aqui su Pass" />
                <label>Celular:</label>
                <input type="text" name="Celular" id="Celular" required onClick="validacion()" placeholder="Escriba aqui su Celular"/>
                <label>Domicilio:</label>
                <input type="text" name="Domicilio" id="Domicilio" onClick="validarNum()" required placeholder="Escriba aqui su Domicilio"/>
                
                <label>Tipo de Usuario:</label>
                <select name="TipoUser" onClick="validarDom()">
                    <option value="Admin">Admin</option>
                    <option value="Normal">Normal</option>
                </select>

               <input type="Submit" name="Nuevo Angel" /> 
            </div> 
                
        </form> 
        
         <footer >
             <br><br><br>
            Desarrollado por Brandon!<br>
            Sitio Web desarrollado en Java.
        </footer>
        
    </body>
</html>
