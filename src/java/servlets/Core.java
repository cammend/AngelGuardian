package servlets;

import dbsql.DBio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cammend
 */
public class Core extends HttpServlet {

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
        
        String userPath = request.getServletPath();
        String url = null;
        
        if( userPath.equals("/contacto") ){
            url = "Contacto.jsp";
        }else if( userPath.equals("/login") ){
            url = "InicioSesion.jsp";
        }else if( userPath.equals("/org") ){
            url = "paginaPrincipalAngel.jsp";
        }else if( userPath.equals("/logout") ){
            request.getSession().removeAttribute("error");
            request.getSession().removeAttribute("TipoSesion");
            request.getSession().removeAttribute("nombre");
            request.getSession().invalidate();
            out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"0;/Angel2/\">");
        }else if( userPath.equals("/entidad") ){
            url = "paginaPrincipalEntidad.jsp";
        }else if( userPath.equals("/org/entidades/top5")){
            url = "/top5.jsp";
        }else if( userPath.equals("/org/user/nuevo")){
            url = "/NuevoAngel.jsp";
        }else if( userPath.equals("/entidad/solicitud/nueva")){
            url = "/NuevaSolicitud.jsp";
        }else if( userPath.equals("/entidad/solicitud/nueva/procesando")){
            ingresarNuevaSolicitud(request,out);
            return;
        }else if( userPath.equals("/org/solicitudes/pendientes")){
            url = "/SolicitudesRegistradas.jsp";
        }else if( userPath.equals("/org/solicitudes/enproceso")){
            url = "/SolicitudesProceso.jsp";
        }
        
        if( url != null ){
            try{
                request.getRequestDispatcher(url).forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        /*
        try {
            /*
             * TODO output your page here. You may use following sample code.
             
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Core</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Core at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
        */
    }
    
    private void ingresarNuevaSolicitud(HttpServletRequest request, PrintWriter out){
        DBio dbio = new DBio();
        String dpi = request.getParameter("dpi");
        String nombreEb = request.getParameter("nombreEb");
        String apellidop = request.getParameter("apellidop");
        String apellidom = request.getParameter("apellidom");
        String nombreEn = request.getParameter("nombreEn");
        String apellidos = request.getParameter("apellidos");
        String telefono = request.getParameter("telefono");
        String dep = request.getParameter("departamento");
        String mun = request.getParameter("municipio");
        String barrio = request.getParameter("barrio");
        String codUser = String.valueOf(request.getSession().getAttribute("Codigo"));
        if( dbio.nuevaSolicitud(dpi, nombreEb, apellidop, apellidom, nombreEn, apellidos, telefono, codUser, dep, mun, barrio) ){
            try {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Core</title>");   
                out.println("<script type=\"text/javascript\">");
                out.println("window.onload = function(){");
                out.println(" alert(\"Datos Ingresados Correctamente\" ");
                out.println("}");
                out.println("</script>");
                out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"5;/Angel2/entidad\">");
                out.println("</head>");
                out.println("<body>");
                out.println("Datos Procesados Correctamente");
                out.println("</body>");
                out.println("</html>");
            } finally {            
                out.close();
            }
        }else{
            try {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet Core</title>");   
                out.println("<script type=\"text/javascript\">");
                out.println("window.onload = function(){");
                out.println(" alert(\"Error al procesar solicitud\" ");
                out.println("}");
                out.println("</script>");
                out.println("<META HTTP-EQUIV=\"REFRESH\" CONTENT=\"5;/Angel2/entidad\">");
                out.println("</head>");
                out.println("<body>");
                out.println("Error al Procesar la solicitud");
                out.println("</body>");
                out.println("</html>");
            } finally {            
                out.close();
            }
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
