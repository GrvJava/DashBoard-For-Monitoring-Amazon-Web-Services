package com.Dash.Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Dash.Dao.DBConnect;

/**
 * Servlet implementation class DUserServlet
 */
@WebServlet("/DUserServlet")
public class DUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DUserServlet() {
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
		String userid = request.getParameter("uid");
		int uid = Integer.parseInt(userid);
		try {
			DBConnect.User_Delete.setInt(1, uid);
		
			int rs = 0;
			rs = DBConnect.User_Delete.executeUpdate();
			if(rs != 0)
			{
				DBConnect.Delete_Server.setString(1, userid);
				rs = DBConnect.Delete_Server.executeUpdate();
						response.sendRedirect("MasterDashBoard.jsp");
			}
			else
			{
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
