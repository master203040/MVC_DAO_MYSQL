/*
 * CODIGO ELABORADO POR: Ing. Héctor Edmundo González Magaña, ing.edmundogm@gmail.com
*  EMPRESA: ITCA-FEPADE, Santa Tecla, La Libertad, El Salvador, CA.

ESTE CODIGO DEBE SER USADO CON FINES DIDACTICOS, SIN FINES DE LUCRO, 
DONDE SE IMPLEMENTE DEBE HACER REFERENCIA AL AUTOR.
 */
package modelado;

import java.util.*;
import java.sql.*;
import uml.Persona;
/**
 *
 * @author hedmundogm
 */
public class DAOPersona implements Operaciones{
    Database db = new Database();
 
    @Override
    public String insertar(Object obj) {
       Persona p = (Persona) obj;
       Connection conn;
       PreparedStatement pst;
       String sql= "insert into persona values(?,?,?,?)";
       String respuesta="";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),
            db.getUsuario(),
            db.getContraseña()            
            );
            pst= conn.prepareStatement(sql);
            pst.setInt(1, p.getId());
            pst.setString(2, p.getNombres());
            pst.setString(3, p.getApellidos());
            pst.setInt(4, p.getEdad());
            int filas =  pst.executeUpdate();
            respuesta = "se registraron " + filas + " nuevo elemento";
            conn.close();       
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;       
    }

    @Override
    public String eliminar(Object obj) {
        Persona p = (Persona) obj;
       Connection conn;
       PreparedStatement pst;
       String sql= "delete from persona where id=?";
       String respuesta="";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),
            db.getUsuario(),
            db.getContraseña()            
            );
            pst= conn.prepareStatement(sql);
            pst.setInt(1, p.getId());
            int filas =  pst.executeUpdate();
            respuesta = "se eliminaron " + filas + " elementos";
            conn.close();       
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta;
    }

    @Override
    public String modificar(Object obj) {
       Persona p = (Persona) obj;
       Connection conn;
       PreparedStatement pst;
       String sql= "update persona set nombres=?, apellidos=?, edad=? where id=?";
       String respuesta="";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),
            db.getUsuario(),
            db.getContraseña()            
            );
            pst= conn.prepareStatement(sql);
            
            pst.setString(1, p.getNombres());
            pst.setString(2, p.getApellidos());
            pst.setInt(3, p.getEdad());
            pst.setInt(4, p.getId());
            
            int filas =  pst.executeUpdate();
            respuesta = "se modificaron " + filas + " elementos";
            conn.close();       
        } catch (ClassNotFoundException | SQLException e) {
        }
        return respuesta; 
    }

    @Override
    public List<Persona> consultar() {
       List<Persona> datos = new ArrayList<>();
       Connection conn;
       PreparedStatement pst;
       ResultSet rs;
       String sql = "select * from persona";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),db.getUsuario(), db.getContraseña());
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Persona(rs.getInt("id"), 
                        rs.getString("nombres"),
                        rs.getString("apellidos"), 
                        rs.getInt("edad")));
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            
        }
       return datos;
       
    }

    @Override
    public List<Persona> filtrar(String campo, String criterio) {
        List<Persona> datos = new ArrayList<>();
       Connection conn;
       PreparedStatement pst;
       ResultSet rs;
       String sql = "select * from persona where " + campo + " like '%"+criterio+"%'";
        try {
            Class.forName(db.getDriver());
            conn = DriverManager.getConnection(
            db.getUrl(),db.getUsuario(), db.getContraseña());
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Persona(rs.getInt("id"), 
                        rs.getString("nombres"),
                        rs.getString("apellidos"), 
                        rs.getInt("edad")));
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            
        }
      return datos;
    }
   
    
}
