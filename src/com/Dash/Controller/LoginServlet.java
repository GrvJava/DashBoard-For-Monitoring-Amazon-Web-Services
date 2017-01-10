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

import com.Dash.Blogic.StrongAES;
import com.Dash.Dao.DBConnect;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String email=request.getParameter("email");
		String password=request.getParameter("password");
	   //  String password = StrongAES.Encrypt(Pass);

		String msg = "";
		try {
			  ResultSet rs = null;
	    	  int ind = email.indexOf("@");
	    	  java.util.Date date = new java.util.Date();
	    	  if(ind == -1)
	    	  {
	      DBConnect.Aid_login.setString(1, email);
	      DBConnect.Aid_login.setString(2, password);
	      rs = DBConnect.Aid_login.executeQuery();
	    	 
	    	 DBConnect.id_date.setString(1, date.toString());
	    	 DBConnect.id_date.setString(2, email);
	    	 DBConnect.id_date.executeUpdate();
	    	  }
	    	  else
	    	  {
	  			DBConnect.pslogin.setString(1, email);
	  			DBConnect.pslogin.setString(2, password);
	  		     rs = DBConnect.pslogin.executeQuery();
		    	 DBConnect.ps_date.setString(1, date.toString());
		    	 DBConnect.ps_date.setString(2, email);
		    	 DBConnect.ps_date.executeUpdate();
	    	  }
		     if(rs.next())
				{
		    	 HttpSession session = request.getSession();
		    	 session.setAttribute("uname",rs.getString(1));
		    	 session.setAttribute("privilige",rs.getString(6));
		    	 session.setAttribute("email",rs.getString(12));
			     if(rs.getString(6).equals("User"))
			     {
			    	 response.sendRedirect("UserDashBoard.jsp?msg=User");
			     }
			     if(rs.getString(6).equals("Admin"))
			     {
			    	 response.sendRedirect("AdminDashBoard.jsp?msg=Admin");
			     }
			     if(rs.getString(6).equals("Master"))
			     {
			    	 response.sendRedirect("MasterDashBoard.jsp?msg=Master");
			     }
				}
		     else
		     {
		    	 response.sendRedirect("00-00-login.jsp?msg=Invalid Id or Password !");
		     }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
