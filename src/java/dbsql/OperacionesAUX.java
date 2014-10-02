
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
    
  
    public void TelP ( int Celular, int Domicilio){
                query = "Insert Into TelP values ("+Celular+","+Domicilio+")";
               try{
                  consulta.executeUpdate(query);
                 
          } catch(Exception e){
                            e.printStackTrace();
                }

}
    
  public void PilotoAngel (int dpi, String Nombre, String ApellidoP, String ApellidoM, String Genero){            
         
              query = "Insert Into PilotoAngel values ("+dpi+",'"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"','"+Genero+"')";
              
            try{
                consulta.executeUpdate(query);
                
            } catch(Exception e){
                 e.printStackTrace();
            }
        }  
    
    
   public void Entidad ( String Nombre){            
         
              query = "Insert Into Entidad values ('"+Nombre+"')";
              
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
    
 

public void UsuarioAng (int DPI, String Nombre, String ApellidoP, String ApellidoM, String Alias, String Password, String Genero,int TipoUser){
           
        String query = "Insert Into UsuarioAngel (DPI,Nombre, ApellidoP, ApellidoM,Alias,Password,Genero,TipoUser) values ("+DPI+",'"+Nombre+"','"+ApellidoP+"','"+ApellidoM+"','"+Alias+"','"+Password+"','"+Genero+"',"+TipoUser+")";
       
            try{
                consulta.executeUpdate(query);
                consulta.close();
            } catch(Exception e){
                 e.printStackTrace();
            }
        }
   
   
   
    public void TelUA (int DPI, int Celular, int Domicilio){
                String Cod = "Select CodigoUA from UsuarioAngel where DPI = "+DPI+" "; 
                int CodigoUA = 0;
                 try{
                    consulta = conex.createStatement();
                     rs = consulta.executeQuery(Cod);
                  while(rs.next()){
                    CodigoUA = rs.getInt("CodigoUA");
                    
                    }          
                } catch (Exception ex) { 
           ex.printStackTrace();
        } 
                        
                
                query = "Insert Into TelUA values ("+CodigoUA+","+Celular+","+Domicilio+")";
                     try{
                            consulta.executeUpdate(query);
                            } catch(Exception e){
                            e.printStackTrace();
                }

} 
    





}
