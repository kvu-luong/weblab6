
package Controller;

import Bean.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShoppingServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        ConnectDB con = new ConnectDB();
        HttpSession session = request.getSession();
       
        
        String action = request.getParameter("action");
        if(action.equals("Submit")){
            String name= request.getParameter("name");
            String visa= request.getParameter("visa");
            String address= request.getParameter("address");
            System.out.println(name);
            
            con.open("weblab6");
            boolean account = con.insertNewAccount(name, visa, address);
            con.close();
            if(account == true){
                String url="product.jsp?name="+name;
                request.getRequestDispatcher(url).forward(request,response);
            }else{
                out.println("failed");
            }
            
        }else{
            if(action.equals("Add to Cart")){
                String product = request.getParameter("product");
                 String username = request.getParameter("username");
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                Product p = xuLyChuoi(product);
                p.setQuantity(quantity);
                con.open("weblab6");
                ArrayList pro = con.insertProduct(username,p.getName(),p.getManufacturer(),p.getCountry(), p.getPrice(), p.getQuantity());
                System.out.println(pro.get(quantity));
                con.close();
                System.out.println(pro.size());
                if(pro.size()>0){
                   session.setAttribute("product", pro);
                   request.getRequestDispatcher("product.jsp?do=1&name="+username).forward(request,response);
                }else{
                    
                    out.println("error in add to cart");
                }
            }
        }
    }
    public Product xuLyChuoi(String chuoi){
        StringTokenizer c = new StringTokenizer(chuoi,"|");
        String name = c.nextToken();
        String manu = c.nextToken();
        String country = c.nextToken();
        String pr = c.nextToken();
        Float price = Float.parseFloat(pr);
        
        Product p = new Product();
        p.setName(name);
        p.setManufacturer(manu);
        p.setCountry(country);
        p.setPrice(price);
        
        return p;
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ShoppingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ShoppingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
