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
            conex = con.getConexion();
            consulta = conex.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void UsuarioAngel(){
        String Alias;
                String UsuAng = "Select Alias from UsuarioAngel where Nombre = 'Gerson'";
                               
                try{
                    
                    consulta = conex.createStatement();
                    resultado = consulta.executeQuery(UsuAng);
                    resultado.next();
                    Alias = resultado.getString("Alias");
                   JOptionPane.showMessageDialog(null,Alias );
                                             
                           
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, ex);
           ex.printStackTrace();
        } 
    }
    
}