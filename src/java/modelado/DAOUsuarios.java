
package modelado;

import java.sql.*;
import java.util.*;
import uml.*;

public class DAOUsuarios implements Operation{
    Database db = new Database();
    
    
    @Override
    public String registrar(Object obj) {
       Usuarios u = (Usuarios) obj;
       Connection conn;
       PreparedStatement pst;
       String sql= "INSERT INTO usuarios VALUES(?,?,?,?,?,?,?,?,?)";
       String respuesta="";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),
            db.getUsuario(),
            db.getContraseña()            
            );
            pst= conn.prepareStatement(sql);
            pst.setInt(1, u.getId());
            pst.setString(2, u.getNombrecompleto());
            pst.setString(3, u.getUsuario());
            pst.setString(4, u.getContra());  
            pst.setString(5, u.getEmail());
            pst.setString(6, u.getTelefono());
            pst.setString(7, u.getCiudad());
            pst.setString(8, u.getPais());
            pst.setInt(9,    u.getNivel());
           
           
            int filas =  pst.executeUpdate();
            respuesta = "se registraron " + filas + " nuevo elemento";
            conn.close();       
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;       
    }
    
     public List<Usuarios> accesar(String usuario, String contra) {
       List<Usuarios> datos = new ArrayList<>();
       Connection conn;
       PreparedStatement pst;
       ResultSet rs;
       String sql = "select nombre_completo, nivelUsuario from usuarios "
               + "where usuario='" + usuario + "' and contra='" + contra+
               "'";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),db.getUsuario(), db.getContraseña());
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Usuarios(rs.getString("nombre_completo"), 
                                       rs.getInt("nivelUsuario")));
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            
        }
       return datos;
    } 
}
