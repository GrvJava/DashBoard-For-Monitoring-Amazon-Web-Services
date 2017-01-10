package com.Dash.Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dash.Blogic.SendEmailToUser;
import com.Dash.Blogic.StrongAES;
import com.Dash.Dao.DBConnect;

/**
 * Servlet implementation class ForgetServlet
 */
@WebServlet("/ForgetServlet")
public class ForgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetServlet() {
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
		ResultSet rs = null;
		ServletContext application = getServletContext();
		 
		 final String aemail=application.getInitParameter("AdminEmail");
	     final String apass=application.getInitParameter("AdminPass");
		String msg = "";
		String subject = "";
		String Text = "";
		try {
			DBConnect.psforget.setString(1, email);
			
		     rs = DBConnect.psforget.executeQuery();
		     if(rs.next())
				{
		    	 String password = StrongAES.Decrypt(rs.getString(5));
		    	 subject = "Reset Password";
		    	 Text = "Your Password is " + password;
		    	String ss = SendEmailToUser.SendEmail(aemail, apass, email, subject, Text);
		    	if(ss.equals("success"))
		    	{
		    	 response.sendRedirect("00-00-login.jsp?msg=A Message Sent to Your email ID !");
		    	}
		    	else
		    	{
			    	 response.sendRedirect("00-00-login.jsp?msg=Error in sending mail !");
		    	}
				}
		     else
		     {
		    	 response.sendRedirect("00-00-login.jsp?msg=Invalid ID !");
		     }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
