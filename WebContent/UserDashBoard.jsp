<%@ include file = "inc/head.html" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.Dash.Dao.DBConnect" %>
<%@ page import="javax.servlet.*" %>
<%@ page errorPage="Error.jsp" %>
<body>
<%
         String uname = (String)session.getAttribute("uname");
        String privilige = (String) session.getAttribute("privilige");
        if(privilige.equals("User"))
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

                <%@ include file = "inc/menu4.html" %>

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
                            
							<th>Status<span ></span></th>
                        </tr>
                    </thead>
                    <tbody>
                   
					<% 
					String email = (String) session.getAttribute("email");
					DBConnect.psudserver.setString(1, email);
					ResultSet rs = DBConnect.psudserver.executeQuery();
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
                        </tr>
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