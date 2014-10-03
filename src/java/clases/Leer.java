package clases;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.*;
import driver.Conexion;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class Leer {

    java.sql.ResultSet resultado = null;
    java.sql.Connection conexion = null;
    java.sql.Statement declaracion = null;
    Conexion con = new Conexion();
    private String error;

    public Leer() {
        try {
            conexion = con.gestionarConexion();
            declaracion = conexion.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<EntidadDepartamento> procesarMapa() {
        ArrayList<EntidadDepartamento> es = new ArrayList();
        String consulta1 = "select CodigoE, Nombre from Entidad";
        String consulta2 = "select count(CodigoE) from Entidad"; //cuantas entidades hay
        try {
            ResultSet resultado2;
            ResultSet resultado3;
            Statement declaracion2 = conexion.createStatement();
            Statement declaracion3 = conexion.createStatement();
            resultado = declaracion.executeQuery(consulta2);
            resultado.next();
            String numEnts = String.valueOf(resultado.getObject("Count(CodigoE)"));
            int numEnt = Integer.parseInt(numEnts);
            //aca obtengo todo los codigos de todas las entidades
            resultado = declaracion.executeQuery(consulta1);
            while (resultado.next()) {
                String cod = String.valueOf(resultado.getObject("CodigoE"));
                String nombre = resultado.getString("Nombre");
                //aca voy sacando todas las solicitudes por cada entidad
                resultado2 = declaracion2.executeQuery("select count(a.CodigoS) from Solicitud a JOIN (USUARIOENT b JOIN Entidad c ON b.CodigoE = " + cod + " and c.CODIGOE = " + cod + ") ON b.CODIGOUE = a.CODIGOUE");
                resultado2.next();
                String numero = String.valueOf(resultado2.getObject("count(a.CodigoS)"));
                resultado3 = declaracion3.executeQuery("select Departamento from DireccionE where CodigoE = "+cod);
                resultado3.next();
                String departamento = resultado3.getString("Departamento");
                es.add(new EntidadDepartamento(nombre,departamento,numero));
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
            error = ex.getMessage();
            ex.printStackTrace();
            return null;
        }
        return es;
    }
    
}