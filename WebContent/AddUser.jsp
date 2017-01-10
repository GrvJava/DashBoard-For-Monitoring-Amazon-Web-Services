<%@ include file = "inc/head.html" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.Dash.Dao.DBConnect" %>
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
		          ResultSet rs = DBConnect.get_id.executeQuery();
            		int id = 0;
					if(rs.next())
							 {
                       id = rs.getInt(1) + 1;
							 }
					else
					{
						id = 1100000;
					}
							 %>
							 <form action='AddUserServlet' method='post' onsubmit="return confirm('Are you sure?')">
						 <tr>
                            <td>
                                <p align = "center">User ID<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value= <%= id %> name = "uid" ><br><span></span></p>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <p align = "center">First Name<br><span></span></p>
                            </td>
                            <td>
                                 <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "fname"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Last Name<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "lname"><br><span></span></p>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <p align = "center">Access Key<br><span></span></p>
                            </td>
                            <td>
                                 <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "akey"><br><span></span></p>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <p align = "center">Secret Key<br><span></span></p>
                            </td>
                            <td>
                                 <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "skey"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Email ID<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" type="email" name = "email"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Mobile No.<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "mob"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Country<br><span></span></p>
                            </td>
                            <td>
                               <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "country"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">City<br><span></span></p>
                            </td>
                            <td>
                              <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" name = "city"><br><span></span></p>
                            </td>
                        </tr>
                        
                                      
                         
                        <tr>
                            <td>
                              
                            </td>
                            <td>
                                <input style="background-color:lightgrey;height:30px" type='submit' value='Add User' />
                            </td>
                        </tr>
							 
                              </form>
							
                    </tbody>
                </table>
            </div>

        </div>
        
        <footer>     
            <div class="container">
                <p>MADE WITH <i class="fa fa-heart"></i><a href="https://www.linkedin.com/in/grvvarshney">Gaurav Varshney</a></p>
                <a href="http://www.teamcomputers.com/">Team Computers</a>
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