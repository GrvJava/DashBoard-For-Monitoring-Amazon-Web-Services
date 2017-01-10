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
                            <th>User<span class="order"></span></th>
                            <th>User ID<span class="order"></span></th>
                            <th>Last Login<span ></span></th>
							<th>Action<span ></span></th>
                        </tr>
                    </thead>
                    <tbody>
										<% 
										DBConnect.admin_to_user.setString(1, "User");	
										ResultSet rs = DBConnect.admin_to_user.executeQuery();
					int i = 0;
					while(rs.next())
							 {
							 %>
                        <tr>
                            <td><%= i++ %></td>
                            <td>
                                <p><%= rs.getString(1) %><br><span><%= rs.getString(9) %></span></p>
                            </td>
                                                        <td>
                                <p><%= rs.getString(12) %><br><span></span></p>
                            </td>
                   
                            <td><span class="date"><%= rs.getString(7) %></span></td>
                            <td>
                               <form action='Admin_to_User.jsp' method='post' onsubmit="return confirm('Are you sure?')">
							   <input type='hidden' name='eid' value='<%= rs.getInt(12) %>' />
                               <input type='submit' value='Get Details' />
                               </form>
                            </td>
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