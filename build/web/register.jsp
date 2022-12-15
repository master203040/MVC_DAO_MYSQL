<%@page import="modelado.DAOUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uml.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Registrar Usuario</title>

    </head>
    
     <%
         DAOUsuarios dao = new DAOUsuarios();
                
    %>
     
    <body>
        
        <div class="d-flex justify-content-center">
            <div class="card  mt-5 shadow-lg p-3 mb-5 bg-body rounded" style="width:450px;">
                <div class="card-body">
                    <h2 class="card-title">Formulario de Registro</h2>
                    <form  name="formPersona" method="POST" action="servUsuarios">
                        <input class="form-control" type="text" name="txtId" placeholder=" Id" size="30"><br>
                        <input class="form-control" type="text" name="txtNombre" placeholder=" Nombre completo" size="30"><br>
                        <input class="form-control" type="text" name="txtUsuario" placeholder="Username" size="30"><br>
                        <input class="form-control" type="password" name="txtContra" placeholder=" Password" size="30"><br>
                        <input class="form-control" type="text" name="txtEmail" placeholder="email" size="30"><br>
                        <input class="form-control" type="text" name="txtTelefono" placeholder=" telefono" size="30"><br>
                        <input class="form-control" type="text" name="txtPais" placeholder=" pais" size="30"><br>
                        <input class="form-control" type="text" name="txtCiudad" placeholder="ciudad" size="30"><br>
                        <input class="form-control" type="text" name="txtNivel" placeholder="Nivel de suario" size="30"><br><br>
                        <input  class="btn btn-primary" type="submit" name="btnRegistrar" value="Registrarse">

                        <input class="btn btn-secondary" type="submit" href="login.jsp" value="Cancelar"><br><br>   
                          <a class="mt-2 text-decoration-none" href="login.jsp">Quieres regresar al Login?</a>
                    </form>
                </div>
            </div>
        </div>    
    </body>
<!-- que chivo va vo-->
</html>

