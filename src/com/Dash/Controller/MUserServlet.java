package com.Dash.Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dash.Dao.DBConnect;

/**
 * Servlet implementation class MUserServlet
 */
@WebServlet("/MUserServlet")
public class MUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String fname = request.getParameter("fname");
	      String lname = request.getParameter("lname");
	      int uid = Integer.parseInt(request.getParameter("uid"));
	      String email = request.getParameter("email");
	      String mob = request.getParameter("mob");
	      String akey = request.getParameter("akey");
	      String skey = request.getParameter("skey");
	      String country = request.getParameter("country");
	      String city = request.getParameter("city");
	      HttpSession session = request.getSession(false);
	   
	    try{
	      DBConnect.Update_dash.setString(1, fname);
	      DBConnect.Update_dash.setString(2, email);
	      DBConnect.Update_dash.setString(3, mob);
	      DBConnect.Update_dash.setString(4, country);
	      DBConnect.Update_dash.setString(5, city);
	      DBConnect.Update_dash.setString(6, lname);
	      DBConnect.Update_dash.setString(7, akey);
	      DBConnect.Update_dash.setString(8, skey);
	      DBConnect.Update_dash.setInt(9, uid);
	      String oemail = (String) session.getAttribute("oemail");
	   
	     int rs = 0 ;
	     rs = DBConnect.Update_dash.executeUpdate();
	     if(rs != 0)
	     {
	    	 response.sendRedirect("MasterDashBoard.jsp");
	     }
	     else
	     {
	    	 
	     }
	     
	    }
	    catch (SQLException e) {
			e.printStackTrace();
		}
	      
	}

}
