package dbsql;

import driver.Conexion;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author cammend
 */
public class DBio {
    //CONSTANTES
    public final int SESSION_ANGEL = 1;
    public final int SESSION_ENTIDAD = 2;
    public final String ADMINISTRADOR = "Admin";
    public final String NORMAL = "Normal";
    
    private Conexion conect = new Conexion();
    private Connection conexion = null;
    private Statement declaracion=null; //Realizar las declraciones de SQL
    private ResultSet resultado=null; //Obtner el resultado de dicha declaracion    
    private String tipoUsuario = null;
    private String nombreEntidad = null;
    
    private String error = null;
    
    public DBio(){
       conexion = conect.gestionarConexion();
       if( conexion != null ){
            try{
                declaracion = conexion.createStatement();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
       error = conect.getError();
    }
    
    public void ingresarEntidad(){
        try{
            declaracion = conect.getConexion().createStatement();
            declaracion.executeUpdate("insert into Entidad (CodigoE,Nombre) values (1,Ejemplo)");
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public int comprobarLogin(String nombre, String pass){
        try{
            resultado = declaracion.executeQuery("select Password, TipoUser from UsuarioAngel where Alias='"+nombre+"'");
            if( resultado.next() ){
                String password = (String)resultado.getObject(1);
                tipoUsuario = (String)resultado.getObject(2);
                if( password.equals(pass) ){
                    //iniciar sesion para Usuario Angel
                    this.cerrar();
                    return SESSION_ANGEL;
                }
            }else{ //si no se encontro el usuario en UsuarioAngel se busca en UsuarioEnt
                resultado = declaracion.executeQuery("select Password, TipoUser, CodigoE from UsuarioEnt where Alias='"+nombre+"'");
                if( resultado.next() ){
                    String password = (String)resultado.getObject(1);
                    tipoUsuario = (String)resultado.getObject(2);
                    String codigoE = (String)resultado.getObject(3);
                    resultado = declaracion.executeQuery("select nombre from Entidad where CodigoE='"+codigoE+"'");
                    if( resultado.next() ){
                        nombreEntidad = (String)resultado.getObject(1);
                    }
                    if( password.equals(pass) ){
                        //iniciar sesion para Usuario Entidad
                        this.cerrar();
                        return SESSION_ENTIDAD;
                    }
                }
            }
        }catch(Exception ex){
            ex.printStackTrace();
            error = "Error procesando datos db: "+ex.getMessage();
        }
        this.cerrar();
        return 0;
    }
    
    public String getTipoUsuario(){
        return tipoUsuario;
    }
    
    public String getError(){
        return error;
    }
    
    public String getNombreEntidad(){
        return nombreEntidad;
    }
    
    private void cerrar(){
        try{
            declaracion.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        try{
            resultado.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
        try{
            conect.cerrar();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}

