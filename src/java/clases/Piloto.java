package clases;

/**
 *
 * @author cammend
 */
public class Piloto {
    private String codigoPiloto;
    private String nombrePiloto;
    
    public Piloto(String codigoPiloto, String nombrePiloto, String apellidoPiloto){
        this.codigoPiloto = codigoPiloto;
        this.nombrePiloto = nombrePiloto + " " + apellidoPiloto;
    }

    public String getCodigoPiloto() {
        return codigoPiloto;
    }

    public String getNombrePiloto() {
        return nombrePiloto;
    }
    
    
}
