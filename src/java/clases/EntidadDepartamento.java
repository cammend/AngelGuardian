package clases;

/**
 *
 * @author cammend
 */
public class EntidadDepartamento {
    private String nombreEntidad;
    private String departamento;
    private String numero;
    
    public EntidadDepartamento(String nombreEntidad, String departamento, String numero){
        this.nombreEntidad = nombreEntidad;
        this.departamento = departamento;
        this.numero = numero;
    }

    public String getDepartamento() {
        return departamento;
    }

    public String getNombreEntidad() {
        return nombreEntidad;
    }

    public String getNumero() {
        return numero;
    }
    
    
}
