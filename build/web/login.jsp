<%@page import="uml.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>LOGIN</title>
    </head>
    <body class="bg-light text-dark">
        <div class="d-flex justify-content-center">
            <div class="card  mt-5 shadow-lg p-3 mb-5 bg-body rounded" style="width: 19rem;">
                <div class="card-body">
                    <h3 class="card-title text-center">LOGIN</h3>
                    <form name="frmLogin" action="servUsuarios" method="POST">
                        <input type="text" class="form-control" name="txtUsuario" value="" size="30" placeholder="Usuario...."/><br>
                        <input type="password"  class="form-control" name="txtContra" value="" size="30" placeholder="Contraseña..." />
                        <br><br>
                        <input type="submit" class="btn btn-primary" value="Iniciar Sesion" name="btnIniciar" />
                        <input type="submit" class="btn btn-secondary" value="Cancelar" name="btnCancelar" />
                        <br><br>
                        <a class="mt-4 text-decoration-none" href="register.jsp">Quieres registrarte?</a>
                    </form>
                </div>
            </div>
        </div>
        
        <%  
            HttpSession sesion = request.getSession();
            
            
             List<Usuarios> datos = new ArrayList<Usuarios>();
                if(request.getAttribute("fail")!=null){
                    out.print("<script>alert('Ususario o contra erroneos!');</script>   ");
                }
                if(request.getAttribute("datos")!=null){
                    datos = (List<Usuarios>)request.getAttribute("datos");
                    String nombrecompleto="";
                    int nivel=0;
                    for(Usuarios u : datos){
                        nombrecompleto = u.getNombrecompleto();
                        nivel = u.getNivel();
                    }
                    sesion.setAttribute("usuario", nombrecompleto);
                    sesion.setAttribute("nivel",nivel);
                    response.sendRedirect("vistaPersona.jsp"); 
                }
                if(request.getParameter("cerrar")!=null){
                    sesion.invalidate();
                    response.sendRedirect("login.jsp");
                }

        %>
        
    </body>
</html>
