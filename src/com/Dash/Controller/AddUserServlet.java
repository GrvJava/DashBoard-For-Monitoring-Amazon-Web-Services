package com.Dash.Controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dash.Blogic.SendEmailToUser;
import com.Dash.Blogic.StrongAES;
import com.Dash.Dao.DBConnect;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
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
	      String akey = request.getParameter("akey");
	      String skey = request.getParameter("skey");
	      String mob = request.getParameter("mob");
	      String country = request.getParameter("country");
	      String city = request.getParameter("city");
			try
			{
	        DBConnect.IDforget.setInt(1, uid);
			ResultSet rss  = DBConnect.IDforget.executeQuery();
			if(rss.next())
			{
				response.sendRedirect("AddUser.jsp?msg=errorinregmaybeuserregistered");
			}
			else
			{
				
				 Random RANDOM = new Random();
					int PASSWORD_LENGTH = 8;
		          String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789@";
		          String pass = "";
					 for (int i=0; i<PASSWORD_LENGTH; i++)
		              {
		                  int index = (int)(RANDOM.nextDouble()*letters.length());
		                  pass += letters.substring(index, index+1);
		              }
					
					 /*
					 ServletContext application = getServletContext();
					  	 
					 final String aemail=application.getInitParameter("AdminEmail");
				     final String apass=application.getInitParameter("AdminPass");
				     
						String msg = "";
						String subject = "Registered Successfull";
						String Text = "Hello "+fname+" \n thanks  for registration, \n Your user Id is : "+String.valueOf(uid)+" \n email id : "+email+" Your Password is : "+pass;
						String ss = SendEmailToUser.SendEmail(aemail, apass, email, subject, Text);
						System.out.println(ss);
						
						*/
						String ss = "success";
						if(ss.equals("success"))
						{
							pass  = StrongAES.Encrypt(pass);
							try
							{
							DBConnect.Add_User.setInt(11, uid);
							DBConnect.Add_User.setString(1, fname);
							DBConnect.Add_User.setString(2, email);
							DBConnect.Add_User.setString(3, mob);
							DBConnect.Add_User.setString(4, pass);
							DBConnect.Add_User.setString(5, country);
							DBConnect.Add_User.setString(6, "User");
							DBConnect.Add_User.setString(7, city);
							DBConnect.Add_User.setString(8, lname);
							DBConnect.Add_User.setString(9, akey);
							DBConnect.Add_User.setString(10, skey);
							DBConnect.Add_User.executeUpdate();	
							response.sendRedirect("AddUser.jsp?msg=useraddedsuccessfully");
							}
							catch(Exception e)
							{
								response.sendRedirect("AddUser.jsp?msg=servererror");
							}
							
							
						}
						else
						{
							response.sendRedirect("AddUser.jsp?msg=errorinregmaybeincorrectemail");
						}	
			}
			}
			catch(Exception e)
			{
				response.sendRedirect("AddUser.jsp?msg=servererror");
			}
			
	     
			 
	}

}
