
package clases;

/**
 *
 * @author cammend
 */
public class Solicitud {
    String codigo;
    String nombreEntidad;
    String nombreUsuario;
    String Fecha;
    String nombrePiloto;
    String nombreEbrio;

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombreEbrio() {
        return nombreEbrio;
    }

    public void setNombreEbrio(String nombreEbrio) {
        this.nombreEbrio = nombreEbrio;
    }

    public String getNombreEntidad() {
        return nombreEntidad;
    }

    public void setNombreEntidad(String nombreEntidad) {
        this.nombreEntidad = nombreEntidad;
    }

    public String getNombrePiloto() {
        return nombrePiloto;
    }

    public void setNombrePiloto(String nombrePiloto) {
        this.nombrePiloto = nombrePiloto;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    
    
}
