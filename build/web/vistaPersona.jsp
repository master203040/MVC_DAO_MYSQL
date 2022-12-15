<%@page import="modelado.DAOPersona"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uml.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<% 

HttpSession ses = request.getSession();
String usuario="";
int nivel=0;

if(ses.getAttribute("usuario")!=null && ses !=null && ses.getAttribute("nivel")!=null){
    usuario = ses.getAttribute("usuario").toString();
    nivel = Integer.parseInt(ses.getAttribute("nivel").toString()); 
    
    if(nivel!=1){
        response.sendRedirect("login.jsp");
    }  
}else{
    response.sendRedirect("login.jsp");
}


%>







<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Vista Pesona</title>
        <!--ESTE JAVASCRIPT ES PARA CARGAR DE LA TABLA A LOS TEXTOS DEL FORMULARIO -->
        <script lang="JavaScript">
            function cargar(id, nombres, apellidos, edad){
                document.formPersona.txtId.value=id;
                document.formPersona.txtNombres.value=nombres;
                document.formPersona.txtApellidos.value=apellidos;
                document.formPersona.txtEdad.value=edad;
            }
        </script>
    </head>
    
     <%
        DAOPersona dao = new DAOPersona();
        List<Persona> datos= new ArrayList();         
    %>
     
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="register.jsp">Registrar un nuevo usuario Aqui!</a>
                <pre class="text-white">Bienvenido <%= usuario%> | nivel Administrador |  <a  class="text-decoration-none"href="login.jsp?cerrar=true">Cerrar Sesion</a></pre>
            </div>
        </nav>

        <div class="d-flex justify-content-center">
            <div class="card  mt-5 shadow-lg p-3 mb-5 bg-body rounded" style="width:450px;">
                <div  class="card-body">
                    <h2>Igresa una Persona</h2>
                    <form  name="formPersona" method="POST" action="SERVPersona">
                        <input class="form-control" type="text" name="txtId" placeholder=" Id de persona" size="30"><br>
                        <input class="form-control" type="text" name="txtNombres" placeholder=" nombres ..." size="30"><br>
                        <input class="form-control" type="text" name="txtApellidos" placeholder="apellidos..." size="30"><br>
                        <input class="form-control" type="text" name="txtEdad" placeholder=" edad ..." size="30"><br><br>

                        <input class="btn btn-primary" type="submit" name="btnInsertar" value="Insertar">
                        <input class="btn btn-info" type="submit"name="btnModificar" value="Modificar">
                        <input class="btn btn-secondary" type="submit" name="btnEliminar" value="Eliminar"><br><br> 

                        <label>Buscar:</label>
                        <input  class="form-control mt-3" type="text" name="txtCriterio">
                        <label>En base a: </label>
                        <input class="form-control mt-3" type="text" name="txtCampo" placeholder="">
                        <input  class="btn btn-primary mt-3" type="submit" name="btnFiltrar" value="Filtrar"> 
                        <input class="btn btn-secondary mt-3" type="submit" name="btnReiniciar" value="Reiniciar"> 
                    </form>
                </div>
            </div>
        </div>
        <!-- EL FORMULARIO PARA INGRESO DE DADTOS -->

        <!-- DISEÑAMOS LA TABLA EN HTML Y LE METEMOS CODIGO JSP -->
        <div class="container">
            <table  class="table">
                <thead>
                    <tr>
                        <th scope="col">ID </th>
                        <th scope="col">NOMBRES</th>
                        <th scope="col">APELLIDOS</th>
                        <th scope="col">EDAD</th>
                        <th scope="col">ACCION</th>
                    </tr>
                </thead>
                <!-- PRIMERO LOS ENCABEZADOS-->
                <!--            <tr>
                            <td>ID </td>  <td>NOMBRES</td>  <td>APELLIDOS </td>  <td> EDAD</td><td> ACCION</td>
                            </tr>-->
                <!-- AHORA TODO EL CONTENIDO DE LA TABLA-->
                <%
                    //ESTOS IF SON PAR VER SI SE RECIBEN ATRIBUTOS DEL SERVLET
                    //SE ESPERA EL ATRIBUTO FILTRO SI ACASO SE HA FILTRADO
                    //SE ESPERA EL ATRIBUTO REINICIO SI ACASO DE REINICIO EL FILTRO
                    //DE NO RECIBIR ATRIBUTOS, SOLO CARGA LA TABLA(LLAMA A CONSULTAR)
                    if (request.getAttribute("filtro") != null) {
                        datos = (List<Persona>) request.getAttribute("filtro");
                    } else if (request.getAttribute("reinicio") != null) {
                        datos = dao.consultar();
                    } else {
                        datos = dao.consultar();
                    }

                    //ESTE BUCLE ES PARA RECORRER EL RESULTADO DE LLAMAR A CONSULTAR          
                    for (Persona p : datos) {
                %>   
                <tbody>
                    <tr>
                        <td> <%=p.getId()%>      </td>
                        <td> <%=p.getNombres()%> </td>
                        <td> <%=p.getApellidos()%></td>
                        <td> <%=p.getEdad()%>    </td>
                        <!--EN ESTA ULTIMA COLUMNA LLAMO AL SCRIPT A LA FUNCION CARGAR Y
                        LE PASO COMO PARAMETROS LO QUE SE IMPRIME EN CADA FILA, EN OTRAS PALABRAS
                        CARA HREF VA QUEDAR ASI: cargar('1','juan','perez','25'), etc-->
                        <td> <a href="javascript:cargar('<%=p.getId()%>',
                                '<%=p.getNombres()%>','<%= p.getApellidos()%>',
                                '<%= p.getEdad()%>')">cargar</a>  </td>
                    </tr>

                </tbody>   
                <%
                    }
                %>
            </table>
        </div>


    </body>

</html>

