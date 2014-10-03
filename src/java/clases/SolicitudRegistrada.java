package clases;

import java.util.Date;

/**
 *
 * @author cammend
 */
public class SolicitudRegistrada {
    private String codigoSolicitud;
    private Date Fecha;
    private String nombreEbrio;
    private String nombreEncargado;
    private String telEncargado;
    
    public SolicitudRegistrada(String codigoSolicitud, Date Fecha, String nombreEbrio, String apellidoEbrio, String nombreEncargado, String apellidoEncargado, String telEncargado){
        this.codigoSolicitud = codigoSolicitud;
        this.Fecha = Fecha;
        this.nombreEbrio = nombreEbrio + " " + apellidoEbrio;
        this.nombreEncargado = nombreEncargado + " " + apellidoEncargado;
        this.telEncargado = telEncargado;
    }

    public String getFecha() {
        return Fecha.toString();
    }

    public String getCodigoSolicitud() {
        return codigoSolicitud;
    }

    public String getNombreEbrio() {
        return nombreEbrio;
    }

    public String getNombreEncargado() {
        return nombreEncargado;
    }

    public String getTelEncargado() {
        return telEncargado;
    }
    
    
}
