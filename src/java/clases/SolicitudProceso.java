package clases;

import java.util.Date;

/**
 *
 * @author cammend
 */
public class SolicitudProceso extends SolicitudRegistrada{
    private String nombrePiloto;
    
    public SolicitudProceso(String codigoSolicitud, Date Fecha, String nombreEbrio, String apellidoEbrio, String nombreEncargado, String apellidoEncargado, String telEncargado, String nombrePiloto, String apellidoPiloto){
        super(codigoSolicitud,Fecha,nombreEbrio,apellidoEbrio,nombreEncargado,apellidoEncargado,telEncargado);
        this.nombrePiloto = nombrePiloto + " " + apellidoPiloto;
    }
    
    public String getNombrePiloto(){
        return nombrePiloto;
    }
}
