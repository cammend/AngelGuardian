package dbsql;

import clases.*;
import driver.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
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
    OperacionesAUX a;
    private Conexion conect = new Conexion();
    private Connection conexion = null;
    private Statement declaracion = null; //Realizar las declraciones de SQL
    private ResultSet resultado = null; //Obtner el resultado de dicha declaracion    
    private String tipoUsuario = null;
    private String nombreEntidad = null;
    private ArrayList<Solicitud> solicitudes = null;
    private Date fecha = null;
    private CallableStatement procNuevaSol;
    private int UserAngel = 0;
    private String error = null;

    public DBio() {
        conexion = conect.gestionarConexion();
        if (conexion != null) {
            try {
                a = new OperacionesAUX(conexion);
                declaracion = conexion.createStatement();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        error = conect.getError();
    }

    public void ingresarEntidad() {
        try {
            declaracion = conect.getConexion().createStatement();
            declaracion.executeUpdate("insert into Entidad (CodigoE,Nombre) values (1,Ejemplo)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public int comprobarLogin(String nombre, String pass) {
        try {
            //JOptionPane.showMessageDialog(null, "yeah");
            resultado = declaracion.executeQuery("select Password, TipoUser, CodigoUA from UsuarioAngel where Alias='" + nombre + "'");
            //JOptionPane.showMessageDialog(null, "yeah");
            if (resultado.next()) {
                String password = (String) resultado.getObject(1);
                int tipo = Integer.parseInt(String.valueOf(resultado.getObject(2)));
                UserAngel = Integer.parseInt(String.valueOf(resultado.getObject(3)));
                tipoUsuario = TipoUsuario.getString(tipo);
                if (password.equals(pass)) {
                    //iniciar sesion para Usuario Angel
                    this.cerrar();
                    return SESSION_ANGEL;
                }
            } else { //si no se encontro el usuario en UsuarioAngel se busca en UsuarioEnt
                resultado = declaracion.executeQuery("select Password, TipoUser, CodigoE, CodigoUE from UsuarioEnt where Alias='" + nombre + "'");
                if (resultado.next()) {
                    String password = (String) resultado.getObject(1);
                    int tipo = Integer.parseInt(String.valueOf(resultado.getObject(2)));
                    tipoUsuario = TipoUsuario.getString(tipo);
                    int codigoE = Integer.parseInt(String.valueOf(resultado.getObject(3)));
                    UserAngel = Integer.parseInt(String.valueOf(resultado.getObject(4)));
                    resultado = declaracion.executeQuery("select nombre from Entidad where CodigoE=" + codigoE);
                    if (resultado.next()) {
                        nombreEntidad = (String) resultado.getObject(1);
                    }
                    if (password.equals(pass)) {
                        //iniciar sesion para Usuario Entidad
                        this.cerrar();
                        return SESSION_ENTIDAD;
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            error = "Error procesando datos db: " + ex.getMessage();
        }
        this.cerrar();
        return 0;
    }

    public int getCodigoUsuario() {
        return UserAngel;
    }

    private void procesarSolicitudesPendientes() {
        String consulta = "select * from Solicitud where Estado='Registrada'";
        solicitudes = new ArrayList();
        ResultSet resultado2 = null;
        try {
            resultado = declaracion.executeQuery(consulta);
            Statement declaracion2 = conexion.createStatement();
            int i = 0;
            while (resultado.next()) {
                String codigoEb = (String) resultado.getObject("CODIGOEB");
                String codigoP = (String) resultado.getObject("CODIGOP");
                solicitudes.add(new Solicitud());
                solicitudes.get(i).setCodigo((String) resultado.getObject("CODIGOS"));
                fecha = (Date) resultado.getObject("FECHA");
                solicitudes.get(i).setFecha(fecha.toString());
                resultado2 = declaracion2.executeQuery("select Nombre, CodigoE from UsuarioEnt where CodigoUE='" + (String) resultado.getObject("CODIGOUE") + "'");
                resultado2.next();
                String codEntidad = (String) resultado2.getObject("CODIGOE");
                solicitudes.get(i).setNombreUsuario((String) resultado2.getObject("NOMBRE"));
                resultado2 = declaracion2.executeQuery("select Nombre from Entidad where CodigoE='" + codEntidad + "'");
                resultado2.next();
                solicitudes.get(i).setNombreEntidad((String) resultado2.getObject("NOMBRE"));
                resultado2 = declaracion2.executeQuery("select Nombre from Ebrio where CodigoEb='" + codigoEb + "'");
                resultado2.next();
                solicitudes.get(i).setNombreEbrio((String) resultado2.getObject("NOMBRE"));
                resultado2 = declaracion2.executeQuery("select Nombre from PilotoAngel where CodigoP='" + codigoP + "'");
                resultado2.next();
                solicitudes.get(i).setNombrePiloto((String) resultado2.getObject("NOMBRE"));
                i++;
            }
            //JOptionPane.showMessageDialog(null, solicitudes.size());
            if (resultado2 != null) {
                resultado2.close();
            }
        } catch (Exception ex) {
            error = ex.getMessage();
            JOptionPane.showMessageDialog(null, ex.getMessage());
            ex.printStackTrace();
        } finally {
            cerrar();
        }
    }

    public ArrayList<EntidadSolicitud> procesarTop5() {
        ArrayList<EntidadSolicitud> temp = new ArrayList();
        ArrayList<EntidadSolicitud> es = new ArrayList();
        String consulta1 = "select * from Entidad";
        String consulta2 = "select count(CodigoE) from Entidad"; //cuantas entidades hay
        try {
            ResultSet resultado2;
            Statement declaracion2 = conexion.createStatement();
            resultado = declaracion.executeQuery(consulta2);
            resultado.next();
            String numEnts = String.valueOf(resultado.getObject("Count(CodigoE)"));
            int numEnt = Integer.parseInt(numEnts);
            resultado = declaracion.executeQuery(consulta1);
            while (resultado.next()) {
                String cod = (String) resultado.getObject("CodigoE");
                resultado2 = declaracion2.executeQuery("select count(a.CodigoS) from Solicitud a JOIN (USUARIOENT b JOIN Entidad c ON b.CodigoE = " + cod + " and c.CODIGOE = " + cod + ") ON b.CODIGOUE = a.CODIGOUE");
                resultado2.next();
                es.add(new EntidadSolicitud((String) resultado.getObject("Nombre"), Integer.parseInt(String.valueOf(resultado2.getObject("Count(a.codigoS)")))));
            }

            //ordenar el resultado
            EntidadSolicitud piv = null;
            int menor;
            for (int i = 0; i < es.size() - 1; i++) {
                menor = i;
                for (int indice = i + 1; indice < es.size(); indice++) {
                    if (es.get(indice).getNumSol() < es.get(menor).getNumSol()) {
                        menor = indice;
                    }
                }
                piv = es.get(i);
                es.set(i, es.get(menor));
                es.set(menor, piv);
            }
            //organizar
            for (int i = 0; i < es.size(); i++) {
                temp.add(es.get(es.size() - (1 + i)));
                if (i == 4) {
                    break;
                }
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
            error = ex.getMessage();
            ex.printStackTrace();
        }

        return temp;
    }

    public boolean nuevaSolicitud(String eb_dpi, String eb_nombre, String eb_ape1, String eb_ape2,
            String en_nombre, String en_ape, String en_tel, String cod_ue, String dep, String mun, String barrio) {

        //String consulta_ebrio = "insert into Ebrio (DPI, Nombre, ApellidoP, ApellidoM) values ("+eb_dpi+",'"+eb_nombre+"','"+eb_ape1+"','"+eb_ape2+"')";
        //String cod_ebrio = null;
        //String consulta_encargado = "insert into EncargadoEbrio values ("+cod_ebrio+",'"+en_nombre+"','"+en_ape+"',"+en_tel+")";
        iniciarProcesoAlmacenado();
        try {
            //primero le asignamos los parametros
            procNuevaSol.setInt(1, Integer.parseInt(eb_dpi));
            procNuevaSol.setString(2, eb_nombre);
            procNuevaSol.setString(3, eb_ape1);
            procNuevaSol.setString(4, eb_ape2);
            procNuevaSol.setString(5, en_nombre);
            procNuevaSol.setString(6, en_ape);
            procNuevaSol.setInt(7, Integer.parseInt(en_tel));
            procNuevaSol.setInt(8, Integer.parseInt(cod_ue));
            procNuevaSol.setString(9, dep);
            procNuevaSol.setString(10, mun);
            procNuevaSol.setString(11, barrio);
            //ejecutamos el procedimiento almacenado
            procNuevaSol.execute();
            //luego leemos el dato de salida
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
            ex.printStackTrace();
            return false;
        }

        return true;
    }

    public ArrayList getSolicitudesEnProceso() {
        ArrayList<SolicitudProceso> SolicitudP = new ArrayList();
        String codigoSolicitud;
        Date Fecha;
        String nombreEbrio;
        String apellidoEbrio;
        String nombreEncargado;
        String apellidoEncargado;
        String telEncargado;
        String nombrePiloto;
        String apellidoPiloto;
        String codPiloto;
        Statement declaracion2;
        ResultSet resultado2;
        try {
            declaracion2 = conexion.createStatement();
            resultado = declaracion.executeQuery("select a.CodigoS, a.Fecha, b.Nombre, b.ApellidoP, c.Nombre, c.Apellido, c.Telefono, a.CodigoP from Solicitud a JOIN (Ebrio b JOIN EncargadoEbrio c ON b.CodigoEb = c.CODIGOEb) ON b.CodigoEb = a.CodigoEb where a.Estado = 'Proceso'");
            //JOptionPane.showMessageDialog(null, "se hizo la consulta");
            while (resultado.next()) {
                codigoSolicitud = String.valueOf(resultado.getObject(1));
                Fecha = resultado.getDate(2);
                nombreEbrio = resultado.getString(3);
                apellidoEbrio = resultado.getString(4);
                nombreEncargado = resultado.getString(5);
                apellidoEncargado = resultado.getString(6);
                telEncargado = resultado.getString(7);
                codPiloto = String.valueOf(resultado.getObject(8));
                resultado2 = declaracion2.executeQuery("select Nombre, ApellidoP from PilotoAngel where CodigoP = " + codPiloto);
                resultado2.next();
                nombrePiloto = resultado2.getString(1);
                apellidoPiloto = resultado2.getString(2);
                //JOptionPane.showMessageDialog(null, "se entró al while");
                SolicitudP.add(new SolicitudProceso(codigoSolicitud, Fecha, nombreEbrio, apellidoEbrio, nombreEncargado, apellidoEncargado, telEncargado, nombrePiloto, apellidoPiloto));
                //JOptionPane.showMessageDialog(null, "se hizo un nuevo add");
            }
            //this.cerrar();
            return SolicitudP;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "error en solicitudes " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean atenderSolicitudesEnProceso(String codigoS, String codigoUA) {
        try {
            //actualizamos la tabla solicitud pasando la solicitud a 'Atendida'
            declaracion.executeQuery("update Solicitud set Estado = 'Atendida' where CodigoS = " + codigoS);
            //se registra el cambio de estado en la solicitud estado
            declaracion.executeUpdate("insert into SolicitudEstado (Estado, CodigoS, CodigoUA, FechaCambio) values ('Proceso'," + codigoS + "," + codigoUA + ",sysdate)");
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public ArrayList getSolicitudesResgistradas() {
        ArrayList<SolicitudRegistrada> SolicitudR = new ArrayList();
        String codigoSolicitud;
        Date Fecha;
        String nombreEbrio;
        String apellidoEbrio;
        String nombreEncargado;
        String apellidoEncargado;
        String telEncargado;
        try {
            resultado = declaracion.executeQuery("select a.CodigoS, a.Fecha, b.Nombre, b.ApellidoP, c.Nombre, c.Apellido, c.Telefono from Solicitud a JOIN (Ebrio b JOIN EncargadoEbrio c ON b.CodigoEb = c.CODIGOEb) ON b.CodigoEb = a.CodigoEb where a.Estado = 'Registrada'");
            //JOptionPane.showMessageDialog(null, "se hizo la consulta");
            while (resultado.next()) {
                codigoSolicitud = String.valueOf(resultado.getObject(1));
                Fecha = resultado.getDate(2);
                nombreEbrio = resultado.getString(3);
                apellidoEbrio = resultado.getString(4);
                nombreEncargado = resultado.getString(5);
                apellidoEncargado = resultado.getString(6);
                telEncargado = resultado.getString(7);
                //JOptionPane.showMessageDialog(null, "se entró al while");
                SolicitudR.add(new SolicitudRegistrada(codigoSolicitud, Fecha, nombreEbrio, apellidoEbrio, nombreEncargado, apellidoEncargado, telEncargado));
                //JOptionPane.showMessageDialog(null, "se hizo un nuevo add");
            }
            //this.cerrar();
            return SolicitudR;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "error en solicitudes " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public ArrayList getPilotosDisponibles() {
        ArrayList<Piloto> piloto = new ArrayList();
        try {
            resultado = declaracion.executeQuery("select CodigoP, Nombre, ApellidoP from PilotoAngel where Disponible = 'Si'");
            String codigo;
            String nombre;
            String apellido;
            while (resultado.next()) {
                codigo = String.valueOf(resultado.getObject(1));
                nombre = resultado.getString(2);
                apellido = resultado.getString(3);
                piloto.add(new Piloto(codigo, nombre, apellido));
            }
            this.cerrar();
            return piloto;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "error en pilotos " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean atenderSolicitud(String codigoS, String codigoP, String codigoUA) {
        if (codigoUA == null) {
            return false;
        }
        try {
            //primero acutalizamos la tabla de pilotoAngel y ponemos Disponible = No
            declaracion.executeUpdate("update PilotoAngel set Disponible = 'No' where CodigoP = " + codigoP);
            //asignamos el codigo del piloto a la tabla Solicitud
            declaracion.executeUpdate("update Solicitud set codigoP = " + codigoP + ", Estado = 'Proceso' where CodigoS = " + codigoS);
            //agregamos una fila a la tabla solicitud estado
            declaracion.executeUpdate("insert into SolicitudEstado (Estado, CodigoS, CodigoUA, FechaCambio) values ('Proceso'," + codigoS + "," + codigoUA + ",sysdate)");
            //retornamos verdadero si no hubo error
            return true;
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public ArrayList<Solicitud> getSolicitudesPendientes() {
        procesarSolicitudesPendientes();
        return solicitudes;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public String getError() {
        return error;
    }

    public String getNombreEntidad() {
        return nombreEntidad;
    }

    private void cerrar() {
        try {
            declaracion.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            resultado.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            conect.cerrar();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void iniciarProcesoAlmacenado() {
        try {
            procNuevaSol = conexion.prepareCall("{call Nueva_Solicitud(?,?,?,?,?,?,?,?,?,?,?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //Estos son mis metodos y manda a llamar los otros metodos de la clase OperacionesAUX
    public void ingresarPiloto(int dpi, String Nombre, String ApellidoP, String ApellidoM, String Genero, int Celular, int Domicilio) {
        a.PilotoAngel(dpi, Nombre, ApellidoP, ApellidoM, Genero);
        a.TelP(Celular, Domicilio);
    }

    public void UsuarioAngel(int DPI, String Nombre, String ApellidoP, String ApellidoM, String Genero, String Alias, String Password, int TipoUser, int Celular, int Domicilio) {
        a.UsuarioAng(DPI, Nombre, ApellidoP, ApellidoM, Genero, Alias, Password, TipoUser);
        a.TelUA(DPI, Celular, Domicilio);

    }

    public void InsertarEntidad(String Nombre, String Departamento, String Municipio, String Colonia, String Barrio, String Cacerio, int Zona) {
        a.Entidad(Nombre);
        a.DireccionE(Nombre, Departamento, Municipio, Colonia, Barrio, Cacerio, Zona);
    }

    // Estos son los metodos para usuario Entidad
    public void InsertarUE(int DPI, String Nombre, String ApellidoP, String ApellidoM, String Alias, String Password, int CodigoE, String Genero, int Celular, int Domicilio, int TipoUser) {
        a.UsuarioEnt(CodigoE, DPI, Nombre, ApellidoP, ApellidoM, Alias, Password, Genero, TipoUser);
        a.TelUE(DPI, Celular, Domicilio);
    }
}
