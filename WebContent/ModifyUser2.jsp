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

    <nav class="left eqh">
    <a class="menu-btn open">
        <div class="ham">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </a>
    <a class="mobile-menu">MENU</a>
    <ul class="menu">
        <li><a href="MasterDashBoard.jsp"><span><i class="fa fa-tachometer"></i></span>
        <p>DASHBOARD</p>
        </a></li>
        <li><a href="AddUser.jsp"><span><i class="fa fa-cog"></i></span><p>ADD USER</p></a></li>
        <li><a href="ModifyUser2.jsp"><span><i class="fa fa-cog"></i></span><p>MODIFY USER</p></a></li>
        <li><a href="DeleteUser.jsp"><span><i class="fa fa-cog"></i></span><p>DELETE USER</p></a></li>
    </ul>
    <div class="bottom">
        <a class="info-btn"><i class="fa fa-info"></i></a>
        <div class="info right">
            <h4>Enter User ID or Email ID</h4>
            </br>
            </br>
            <form action="ModifyUser2.jsp" method="post">
            <input style="background-color:lightgrey;height:40px" type="text" name="userid" />
            </br>
            </br>
            <input type="submit" value="GO" />
            </form>
            </br>
            </br>
            </br>
            <a class="menu-back"><i class="fa fa-chevron-left"></i></a>
        </div>
    </div>
</nav>

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
                  if(userid != null)
                  {
                	  ResultSet rs = null;
                	  int ind = userid.indexOf("@");
                	  if(ind == -1)
                	  {
                		  int ii = 0;
                		  try{
                			  ii = Integer.parseInt(userid);
                		  }
                		  catch(Exception e)
                		  {
                		    out.println("</br></br><h1 align='center'>invalid user ID or Email ID</h1>");
                		  }
			      DBConnect.Aid_Search.setInt(1, ii);
		          rs = DBConnect.Aid_Search.executeQuery();
                	  }
                	  else
                	  {
            		      DBConnect.psforget.setString(1, userid);
        		          rs = DBConnect.psforget.executeQuery();
                	  }
					if(rs.next())
							 {

                        session.setAttribute("oemail",rs.getString(3));
                       
							 %>
							 <form action='MUserServlet' method='post' onsubmit="return confirm('Are you sure?')">
						 <tr>
                            <td>
                                <p align = "center">User ID<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value="<%= rs.getInt(12) %>" name = "uid" ><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">First Name<br><span></span></p>
                            </td>
                            <td>
                                 <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(1) %>" name = "fname"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Access key<br><span></span></p>
                            </td>
                            <td>
                                 <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(10) %>" name = "akey"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Secret Key<br><span></span></p>
                            </td>
                            <td>
                                 <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(11) %>" name = "skey"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Last Name<br></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(9) %>" name = "lname"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Email ID<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(2) %>" name = "email"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Mobile No.<br><span></span></p>
                            </td>
                            <td>
                                <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(3) %>" name = "mob"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">Country<br><span></span></p>
                            </td>
                            <td>
                               <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(5) %>" name = "country"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p align = "center">City<br><span></span></p>
                            </td>
                            <td>
                              <p><input style="background-color:lightgrey;height:30px;width:250px" type = "text" value = "<%= rs.getString(8) %>" name = "city"><br><span></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              
                            </td>
                            <td>
                                <input style="height:30px"type='submit' value='Update Details' />
                            </td>
                        </tr>
							 
                              </form>
							 <%
							}
					else
					{
						%>
						</br>
						</br>
						</br>
						</br>
						<h1 align="center">USER NOT FOUND !!</h1>
						<% 
					}
							%>
                    </tbody>
                </table>
                <%
                  }
                %>
            </div>

        </div>
        
        <footer>     
         
          
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