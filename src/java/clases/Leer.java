package clases;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.*;
import driver.Conexion;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class Leer {

    java.sql.ResultSet resultado = null;
    java.sql.Connection conex = null;
    java.sql.Statement consulta = null;
    Conexion con = new Conexion();

    public Leer() {
        try {
            conex = con.gestionarConexion();
            consulta = conex.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String UsuarioAngel(){
        String Alias = null;
        String UsuAng = "select Nombre from UsuarioAngel where CodigoUA = 1";
        try{
            consulta = conex.createStatement();
            resultado = consulta.executeQuery(UsuAng);
            resultado.next();
            Alias = resultado.getString("Nombre");
            JOptionPane.showMessageDialog(null,Alias );
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
           ex.printStackTrace();
        }
        return Alias;
    }
    
}