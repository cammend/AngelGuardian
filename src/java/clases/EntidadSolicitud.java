package clases;

/**
 *
 * @author cammend
 */
public class EntidadSolicitud {
    private String codEntidad;
    private int numSol;
    
    public EntidadSolicitud(String codEntidad, int numSol){
        this.codEntidad = codEntidad;
        this.numSol = numSol;
    }

    public String getCodEntidad() {
        return codEntidad;
    }

    public void setCodEntidad(String codEntidad) {
        this.codEntidad = codEntidad;
    }

    public int getNumSol() {
        return numSol;
    }

    public void setNumSol(int numSol) {
        this.numSol = numSol;
    }
}
