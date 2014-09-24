/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dbsql.DBio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cammend
 */
public class ProcesaSesion extends HttpServlet {
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    HttpSession sesionUsuario;
    PrintWriter out;
    HttpServletRequest request;
    private String error = "El usuario o contraseña son incorrectos.";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        this.request = request;
        out = response.getWriter();
        sesionUsuario = request.getSession();
        
        DBio dbio = new DBio();//nueva instancia de la clase que maneja las consultas
        int tipoLogin = dbio.comprobarLogin(request.getParameter("nombre"), request.getParameter("pass"));
        if( tipoLogin == dbio.SESSION_ANGEL ){
            sesionUsuario.setAttribute("nombre", request.getParameter("nombre"));
            sesionUsuario.setAttribute("TipoSesion", "SesionAngel");
            if( dbio.getTipoUsuario().equals(dbio.ADMINISTRADOR) ){
                sesionUsuario.setAttribute("TipoUsuario","Admin");
            }else{
                sesionUsuario.setAttribute("TipoUsuario", "Normal");
            }
            try{
                out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"0;/Angel/org\">");
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }else if( tipoLogin == dbio.SESSION_ENTIDAD ){
            sesionUsuario.setAttribute("nombre", request.getParameter("nombre"));
            sesionUsuario.setAttribute("TipoSesion", "SesionEntidad");
            sesionUsuario.setAttribute("NombreEntidad", dbio.getNombreEntidad());
            if( dbio.getTipoUsuario().equals(dbio.ADMINISTRADOR) ){
                sesionUsuario.setAttribute("TipoUsuario","Admin");
            }else{
                sesionUsuario.setAttribute("TipoUsuario", "Normal");
            }
            out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"0;/Angel/entidad\">");
        }else{//si hay fallo en usuario o contraseña
            if( dbio.getError() != null ){
                error = dbio.getError();
            }
            sesionUsuario.setAttribute("error", error);
            out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"0;/Angel/login\">");
        }
        
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            
        } finally {            
            out.close();
        }
    }
    
    private void paginaError(){
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet ProcesaSesion</title>");
        out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"0;org/index.jsp\">");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet ProcesaSesion at " + request.getContextPath() + "</h1>");
        out.println("</body>");
        out.println("</html>");
    }
    
    private void paginaExito(){
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
