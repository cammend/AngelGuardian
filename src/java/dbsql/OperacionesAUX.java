
package dbsql;
import driver.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OperacionesAUX {
     private Connection conex= null;
    private Statement consulta = null;
    private ResultSet rs = null; 
    private String query = null;
    
    //Conexion con = new Conexion();
    
    public OperacionesAUX(Connection con){
    
        conex = con;
        try {
            consulta = conex.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(DBio.class.getName()).log(Level.SEVERE, null, ex);
        }
}
    
  
    public void TelP (String CodigoP, String Celular, String Domicilio){
                query = "Insert Into TelP values ('"+CodigoP+"','"+Celular+"','"+Domicilio+"')";
               try{
                  consulta.executeUpdate(query);
                 
          } catch(Exception e){
                            e.printStackTrace();
                }

}
    
  public void PilotoAngel (String dpi, String Nombre, String ApellidoP, String ApellidoM, String CodigoP, String Genero){            
         
              query = "Insert Into PilotoAngel values ('"+dpi+"','"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"','"+CodigoP+"','"+Genero+"')";
              
            try{
                consulta.executeUpdate(query);
                
            } catch(Exception e){
                 e.printStackTrace();
            }
        }  
    
    
   public void Entidad (String CodigoE, String Nombre){            
         
              query = "Insert Into Entidad values ('"+CodigoE+"','"+Nombre+"')";
              
            try{
                consulta.executeUpdate(query);
                
            } catch(Exception e){
                 e.printStackTrace();
            }
        }  
    
   public void DireccionE (String CodigoE, String Departamento,String Municipio,String Colonia,String Barrio,String Cacerío){            
      
       
       
              query = "Insert Into DireccionE values ('"+CodigoE+"','"+Departamento+"','"+Municipio+"','"+Colonia+"','"+Barrio+"','"+Cacerío+"')";
              
            try{
                consulta.executeUpdate(query);
                
            } catch(Exception e){
                 e.printStackTrace();
            }
        }   
    
   public void UsuarioAng (String DPI, String Nombre, String ApellidoP, String ApellidoM, String Alias, String Password,String CodigoUA, String Genero,String TipoUser){
            String query = "Insert Into UsuarioAngel values ('"+DPI+"','"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"','"+Alias+"','"+Password+"','"+CodigoUA+"','"+Genero+"','"+TipoUser+"')";
            try{
                consulta.executeUpdate(query);
                
            } catch(Exception e){
                 e.printStackTrace();
            }
        }
   
    public void TelUA (String CodigoUA, String Celular, String Domicilio){
                query = "Insert Into TelUA values ('"+CodigoUA+"','"+Celular+"','"+Domicilio+"')";
               try{
                  consulta.executeUpdate(query);
                            } catch(Exception e){
                            e.printStackTrace();
                }

} 
    
     public void insertarEbrio(int CodigoEb, int DPI,String Nombre, String ApellidoP, String ApellidoM){
                
        query = "insert into Ebrio (CodigoEb,DPI,Nombre,ApellidoP,ApellidoM) values ("+CodigoEb+","+DPI+",'"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"')";
              
        try{
                              
            consulta.executeUpdate(query);                 
            consulta.close(); 
           
        }catch(Exception ev){
         ev.printStackTrace();
        }
           
    }
public void TelUE (String CodigoUE, String Celular, String Domicilio){
                query = "Insert Into TelUE values ('"+CodigoUE+"','"+Celular+"','"+Domicilio+"')";
               try{
                  consulta.executeUpdate(query);
                            } catch(Exception e){
                            e.printStackTrace();
                }

} 
    
}
