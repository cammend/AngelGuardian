package driver;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author cammend
 */
public class Conexion {
    private static final String host = "localhost";
    private static final int puerto = 1521;
    private static final String user = "cammend";
    private static final String pass = "cammend";
    private static final String id = "XE";
    private static String error = null;
    private static Connection conexion = null;
    
    public static void cargarDriver()
    {
        try
        {
            //Cargarmos los drivers para manejar la base de datos.
            Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Drivers de Oracle no encontrados: " + e.getMessage());
            error = "Drivers de Oracle no encontrados: " + e.getMessage();
            System.exit(0);
        }
        catch(IllegalAccessException e)
        {
            System.out.println("Acceso no permitido a los drivers de Oracle: " + e.getMessage());
            error = "Acceso no permitido a los drivers de Oracle: " + e.getMessage();
            System.exit(0);
        }
        catch(InstantiationException e)
        {
            System.out.println("No se ha podido instanciar los drivers de Oracle: " + e.getMessage());
            error = "No se ha podido instanciar los drivers de Oracle: " + e.getMessage();
            System.exit(0);
        }
        catch(Exception e)
        {
            System.out.println("Error cargando los drivers de oracle: " + e.getMessage());
            error = "Error cargando los drivers de oracle: " + e.getMessage();
            System.exit(0);
        }
    }
    
    public static Connection getConexion(){
        return conexion;
    }
    
    public static void conectar(){
        if( error == null ){
            try{
                conexion = DriverManager.getConnection("jdbc:oracle:thin:@//"+host+":"+puerto+"/"+id,user,pass);
            }catch(Exception ex){
                System.out.println("Error iniciando la conexión a la base de datos: " + ex.getMessage());
                error = "Error iniciando la conexión a la base de datos: " + ex.getMessage();
            }
        }
    }
    
    public String getError(){
        return error;
    }
    
    public Connection gestionarConexion(){
        cargarDriver();
        conectar();
        return conexion;
    }
    
    public void cerrar(){
        try{
            conexion.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
}