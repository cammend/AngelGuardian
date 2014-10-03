/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;



import dbsql.DBio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Gerson pineda
 */ 
@WebServlet(name = "UsuarioEnt", urlPatterns = {"/UsuarioEnt"})
public class UsuarioEnt extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           DBio objeto = new DBio();
           String CodigoE = request.getParameter("CodigoE");
           String  DPI = request.getParameter("DPI");
           String Nombre = request.getParameter("Nombre");
           String ApellidoP = request.getParameter("ApellidoP");
           String ApellidoM = request.getParameter("ApellidoM");
           String Genero = request.getParameter("Genero");
           String Alias = request.getParameter("Alias");
           String Password = request.getParameter("Password");
           String Tipo_Usuario = request.getParameter("TipoUser");
           String Celular = request.getParameter("Celular");
           String Domicilio = request.getParameter("Domicilio");
           
         objeto.InsertarUE(Integer.parseInt(DPI), Nombre, ApellidoP, ApellidoM, Alias, Password, Integer.parseInt(CodigoE), Genero,Integer.parseInt(Celular), Integer.parseInt(Domicilio), Integer.parseInt(Tipo_Usuario));
        
         try{
                  
                  
                 out.println("<html>");
                 out.println("<head>");
                 out.println("<title>Servlet ProcesaSesion</title>");
                 out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"0;/index.jsp\">");
                 out.println("</head>");
                 out.println("<body>");
                 out.println("<h1>Servlet ProcesaSesion at " + request.getContextPath() + "</h1>");
                 out.println("</body>");
                 out.println("</html>");
            }catch(Exception ex){
               
                JOptionPane.showMessageDialog(null, ex);
           
            }
        } finally {            
            out.close();
        }
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
