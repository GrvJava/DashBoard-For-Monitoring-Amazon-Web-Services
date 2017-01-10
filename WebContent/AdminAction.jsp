<%@ include file = "inc/head.html" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.Dash.Dao.DBConnect" %>
<%@ page errorPage="Error.jsp" %>
<body>
<%
         String uname = (String)session.getAttribute("uname");
        String privilige = (String) session.getAttribute("privilige");
        if(privilige.equals("Admin"))
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

                <%@ include file = "inc/menu3.html" %>

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
                    <thead>
                        <tr>
                            <th>Sr.<span class="order"></span></th>
                            <th>Server Name<span class="order"></span></th>
                            <th>Server ID<span class="order"></span></th>
                            <th>User ID<span class="order"></span></th>
                            <th>Status<span ></span></th>
                            <th>ACTION<span ></span></th>
                        </tr>
                    </thead>
                    <tbody>
						<% 
					ResultSet rs = DBConnect.admin_action.executeQuery();
					int i = 0;
					while(rs.next())
					{
							 %>
                        <tr>
                            <td><%= i++ %></td>
                            <td>
                                <p><%= rs.getString(1) %><br><span></span></p>
                            </td>
                            <td>
                                <p><%= rs.getString(4) %><br><span></span></p>
                            </td>
                                                        <td>
                                <p><%= rs.getString(2) %><br><span></span></p>
                            </td>
                           <%
                              if((rs.getString(3)).equals("on"))
                              {
                            %>
							<td>
                                <span class="date"><font color="green"><%= rs.getString(3) %></font></span>
                            </td>
                            <%
                              }
                              else
                              {
                            	  %>
                            	  <td>
                                  <span class="date"><font color="red"><%= rs.getString(3) %></font></span>
                              </td> 
                              
                            <%
                              }
                            %>
                            <%
                      
                            String d = rs.getString(4);
                   
                            if(rs.getString(3).equals("on"))
                            {
                            %>
							<td>
							<form action='AMServlett' method='post' onsubmit="return confirm('Are you sure?')">
							   <input type='hidden' name='status' value='off'/>
							   <input type='hidden' name='serverid' value='<%= d %>'/>
                               <input type='submit' value='DO OFF' />
                               </form>
                            </td>
                            <% 
                            }
                            else
                            {
                            %>
                            <td>
                               	<form action='AMServlett' method='post' onsubmit="return confirm('Are you sure?')">
							   <input type='hidden' name='status' value='on'/>
							   <input type='hidden' name='serverid' value='<%= d %>'/>
                               <input type='submit' value='DO ON' />
                               </form>
                            </td>
                        </tr>
                        </tr>
                          <%
                            }
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