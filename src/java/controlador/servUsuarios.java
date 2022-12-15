/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelado.DAOUsuarios;
import uml.Persona;
import uml.Usuarios;

/**
 *
 * @author hector.gonzalez
 */
public class servUsuarios extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        

            
        try (PrintWriter out = response.getWriter()) {
            
            String usuario="";
            String contra="";
            DAOUsuarios dao = new DAOUsuarios();
            Usuarios u = new Usuarios();
            List<Usuarios> datos = new ArrayList<Usuarios>();
            
            String respuesta="";
            String campo, criterio;
            
            
            if(request.getParameter("btnIniciar")!=null){
                usuario =  request.getParameter("txtUsuario");
                contra = request.getParameter("txtContra");              
                datos = dao.accesar(usuario, contra);
                if(datos.size()> 0){
                    request.setAttribute("datos", datos);                  
                    request.getRequestDispatcher("login.jsp").forward(request, response);               
                }else{
                    request.setAttribute("fail","No hay acceso!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                
                
                
                
                
            }
            else if(request.getParameter("btnRegistrar")!=null){
                    u.setId(Integer.parseInt(request.getParameter("txtId")));
                    u.setNombrecompleto(request.getParameter("txtNombre"));
                    u.setUsuario(request.getParameter("txtUsuario"));
                    u.setContra(request.getParameter("txtContra")); 
                    u.setEmail(request.getParameter("txtEmail"));
                    u.setTelefono(request.getParameter("txtTelefono"));
                    u.setPais(request.getParameter("txtPais"));
                    u.setCiudad(request.getParameter("txtCiudad"));
                    u.setNivel(Integer.parseInt(request.getParameter("txtNivel")));
                    respuesta= dao.registrar(u);
                    request.setAttribute("respuesta", respuesta);
            }
            
            
            
            
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
