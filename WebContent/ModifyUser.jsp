<%@ include file = "inc/head.html" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.Dash.Dao.DBConnect" %>
<%@ page import="com.Dash.Blogic.StrongAES" %>
<%@ page errorPage="Error.jsp" %>
<body>
       <%
         String uname = (String)session.getAttribute("uname");
        String privilige = (String) session.getAttribute("privilige");
        if(privilige.equals("Master"))
        {
        %>
        <header class="clearfix">
    <div class="user left clearfix">
        <div class="avatar"><img src="images/avatar.png" alt="user"></div>
        <p><%=  uname %><br><span><%=  privilige %></span></p>
        <a href="logout.jsp" class="logout"><i class="fa fa-power-off"></i></a>
    </div>
	</header>
	<div id="wrapper" class="clearfix expand">

                <%@ include file = "inc/menu2.html" %>

        <div id="content" class="right">

            <div class="breadcrumbs clearfix">
                <ul class="breadcrumbs left">
                    <li><a href="#">ID STUDIO CMS</a></li>
                    <li><i class="fa fa-angle-right"></i></li>
                    <li>TABLES</li>
                </ul>
            </div>

            <div class="tables clearfix">
                <table class="datatable adm-table">
            		<% 
	              String userid = request.getParameter("userid");
			      DBConnect.IDforget.setInt(1, Integer.parseInt(userid));
		          ResultSet rs = DBConnect.IDforget.executeQuery();
					if(rs.next())
							 {

                        session.setAttribute("oemail",rs.getString(2));
                       
							 %>
							 <form action='MUserServlet' method='post' onsubmit="return confirm('Are you sure?')">
						 <tr>
                            <td>
                                <p align = "center">User ID<br><span></span></p>
                            </td>
                            <td>
                                <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getInt(12) %>" name = "uid"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">First Name<br><span></span></p>
                            </td>
                            <td>
                                 <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(1) %>" name = "fname"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Last Name<br><span></span></p>
                            </td>
                            <td>
                                <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(9) %>" name = "lname"><br><span></span></p>
                            </td>
                        </tr>
                        		 <tr>
                            <td>
                                <p align = "center">Access Key<br><span></span></p>
                            </td>
                            <td>
                                <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(10) %>" name = "akey"><br><span></span></p>
                            </td>
                        </tr>
                        		 <tr>
                            <td>
                                <p align = "center">Secret Key<br><span></span></p>
                            </td>
                            <td>
                                <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(11) %>" name = "skey"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Email ID<br><span></span></p>
                            </td>
                            <td>
                                <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(2) %>" name = "email"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Mobile No.<br><span></span></p>
                            </td>
                            <td>
                                <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(3) %>" name = "mob"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Country<br><span></span></p>
                            </td>
                            <td>
                               <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(5) %>" name = "country"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">City<br><span></span></p>
                            </td>
                            <td>
                              <p><input type = "text" style="background-color:lightgrey;height:30px;width:250px" value = "<%= rs.getString(8) %>" name = "city"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              
                            </td>
                            <td>
                                <input type='submit' value='Update Details' />
                            </td>
                        </tr>
							 
                              </form>
							 <%
							}
							%>
                    </tbody>
                </table>
            </div>

        </div>
        
        <footer>     
            <div class="container">
                <p>MADE WITH <i class="fa fa-heart"></i> IN LONDON</p>
                <a href="http://www.netdreams.co.uk/">WEB AGENCY LONDON</a>
            </div>
        </footer>

    </div>

    <%@ include file = "inc/footer.html" %>
    
    <%
        }
        else
        {
        	  session.invalidate();
        	  response.sendRedirect("00-00-login.jsp?msg=pleaseloginfirst");
        }
    %>

</body>
</html>