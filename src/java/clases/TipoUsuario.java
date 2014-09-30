package clases;

/**
 *
 * @author cammend
 */

//esta clase solo sive para saber que tipo de usuario se lee o escribe en la db
//ya que el tipo de usuario se escribe como un numero en la db, y no como una cadena.
//esta clase se puede usar directamente sin crear un objeto (new).
public class TipoUsuario {
    public static final int ADMINISTRADOR = 1;
    public static final int NORMAL = 2;
    
    public static String getString(int n){
        if( n == 1){
            return "Administrador";
        }else if( n == 2 ){
            return "Normal";
        }
        return null;
    }
}
