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
 * Servlet implementation class UActionServlet
 */
@WebServlet("/UActionServlet")
public class UActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UActionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
		String server = request.getParameter("serverid");
		String status = request.getParameter("status");
		HttpSession session = request.getSession(false);
	
		try {
			Process p = Runtime.getRuntime().exec("ec2-start-instances -O AKIAJPAVPTZJYABCFG6Q -W QX7egFZSE3pFX7XP0eNw9aDHxnYHvzhLvG49FvmO i-0a75389770174c65c --region us-west-2 | awk '{print $4}';");
			DBConnect.user_action.setString(1, server);
			ResultSet rs = DBConnect.user_action.executeQuery();
			if(rs.next())
			{
				DBConnect.user_update.setString(1, status);
				DBConnect.user_update.setString(2, server);
				DBConnect.user_update.executeUpdate();
				String privilige = (String) session.getAttribute("privilige");
				if(privilige.equals("User"))
				
				response.sendRedirect("UserAction.jsp");
				
				
			}
			else
			{
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}
}
