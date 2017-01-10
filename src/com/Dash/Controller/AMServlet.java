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
 * Servlet implementation class AMServlet
 */
@WebServlet("/AMServlet")
public class AMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AMServlet() {
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
		String server = request.getParameter("serverid");
		String status = request.getParameter("status");
		
	
		try {
			DBConnect.user_action.setString(1, server);
			ResultSet rs = DBConnect.user_action.executeQuery();
			if(rs.next())
			{
				DBConnect.user_update.setString(1, status);
				DBConnect.user_update.setString(2, server);
				DBConnect.user_update.executeUpdate();
		
				response.sendRedirect("AdminDashBoard.jsp");
				
				
			}
			else
			{
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
