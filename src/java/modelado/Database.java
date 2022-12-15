package modelado;



public class Database {
    private final String driver;
    private final String url;
    private final String usuario;
    private final String contraseña;

    public Database() {
        this.driver = "com.mysql.jdbc.Driver";
        this.url = "jdbc:mysql://localhost:3306/proyect";
        this.usuario = "root";
        this.contraseña = "";
    }

    public String getDriver() {
        return driver;
    }

    public String getUrl() {
        return url;
    }

    public String getUsuario() {
        return usuario;
    }

    public String getContraseña() {
        return contraseña;
    }
    
    
   
    
}
