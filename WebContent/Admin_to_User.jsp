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
        <li><a href="AdminDashBoard.jsp"><span><i class="fa fa-tachometer"></i></span><p>DASHBOARD</p></a></li>
       <li class="active"><a href="AdminAction.jsp"><span><i class="fa fa-cog"></i></span><p>ACTION</p></a></li>
    </ul>
    <div class="bottom">
        <a class="info-btn"><i class="fa fa-info"></i></a>
        <div class="info right">
        <%
        String eid = (String) request.getParameter("eid");
    	DBConnect.IDforget.setInt(1, Integer.parseInt(eid));
		ResultSet ru = DBConnect.IDforget.executeQuery();
		ru.next();
        %>
            <h4>User Details</h4></br>
            <p>
            ID - <%= ru.getInt(12) %>
            </br>
           <b> Name - </b><%= ru.getString(1)+" "+ru.getString(9) %></br>
           <b> Email - </b></br><%= ru.getString(2) %></br>
          <b>  Mob No. -</b> <%= ru.getString(3) %></br>
           <b> Address - </b><%= ru.getString(8)+ " , " + ru.getString(5) %></br>
           <b> Last Login -</b></br> <%= ru.getString(7) %></br>
            </p> 
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
                    <thead>
                        <tr>
                            <th>Sr.<span class="order"></span></th>
                            <th>Server Name<span class="order"></span></th>
                            <th>Server ID<span class="order"></span></th>
							<th>Status<span ></span></th>
							<th>Action<span ></span></th>
                        </tr>
                    </thead>
                    <tbody>
					<% 
					DBConnect.psudserver.setString(1, eid);
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
                            <%
                      
                            String d = rs.getString(4);
                   
                            if(rs.getString(3).equals("on"))
                            {
                            %>
							<td>
							<form action='AMServlet' method='post' onsubmit="return confirm('Are you sure?')">
							   <input type='hidden' name='status' value='off'/>
							   <input type='hidden' name='eid' value='<%= eid %>'/>
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
                               	<form action='AMServlet' method='post' onsubmit="return confirm('Are you sure?')">
							   <input type='hidden' name='status' value='on'/>
							 <input type='hidden' name='eid' value='<%= eid %>'/>
							   <input type='hidden' name='serverid' value='<%= d %>'/>
                               <input type='submit' value='DO ON' />
                               </form>
                            </td>
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