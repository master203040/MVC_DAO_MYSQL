
package modelado;

import java.util.List;

public interface Operaciones {
    
    //APARA DEFINIR COMPORTAMIENTOS SIMILARES A OBJETOS DIFERENTES
    //HABRAN VARIAS CLASES DAO QUE IMPLEMENTARAN LA INTERFAZ PARA
    //QUE HAGAN LO MISMO.....
    public String insertar(Object obj);
    public String eliminar(Object obj);
    public String modificar(Object obj);
    public List<?> consultar();
    public List<?> filtrar(String campo, String criterio); 
    
    
}
