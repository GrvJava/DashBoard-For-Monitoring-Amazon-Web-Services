package com.Dash.Dao;
import java.sql.*;
public class DBConnect {
	public static String username ="root";
	public static String password="root123";
	public static String url="jdbc:mysql://localhost:3306/dashboard";
	public static String driver="com.mysql.jdbc.Driver";
	public static  Connection con =null;
	public static PreparedStatement pslogin = null;
	public static PreparedStatement psforget = null;
	public static PreparedStatement IDforget = null;
	public static PreparedStatement psudserver = null;
	public static PreparedStatement user_action = null;
	public static PreparedStatement user_update = null;
	public static PreparedStatement admin_to_user = null;
	public static PreparedStatement ps_date = null;
	public static PreparedStatement id_date = null;
	public static PreparedStatement admin_action = null;
	public static PreparedStatement Ma_Delete = null;
	public static PreparedStatement User_Delete = null;
	public static PreparedStatement Update_dash = null;
	public static PreparedStatement Assign_Server = null;
	public static PreparedStatement update_Server = null;
	public static PreparedStatement get_id = null;
	public static PreparedStatement Add_User = null;
	public static PreparedStatement Aid_Search = null;
	public static PreparedStatement Delete_Server = null;
	public static PreparedStatement Aid_login = null;
	
	static
	{
		try
		{
			Class.forName(driver);
			con = (Connection) DriverManager.getConnection(url, username  ,password  );
			System.out.println("Connection created Scuccessfull");
			pslogin=con.prepareStatement("select * from dashmember_info where email = ? and password  = ?");
			Aid_login=con.prepareStatement("select * from dashmember_info where AID = ? and password  = ?");
			psforget=con.prepareStatement("select * from dashmember_info where email = ? ");
			IDforget=con.prepareStatement("select * from dashmember_info where AID = ? ");
			psudserver=con.prepareStatement("select * from server where ASSIGNED_TO = ? ");
			user_action=con.prepareStatement("select * from server where SERVER_ID = ? ");
			user_update=con.prepareStatement("UPDATE server  SET  STATUS = ? WHERE SERVER_ID = ?");	
			admin_to_user=con.prepareStatement("select * from dashmember_info where PRIVILIGE = ?");
			ps_date=con.prepareStatement("UPDATE dashmember_info  SET  LAST_LOGIN = ? WHERE EMAIL = ?");
			id_date=con.prepareStatement("UPDATE dashmember_info  SET  LAST_LOGIN = ? WHERE AID = ?");
			admin_action=con.prepareStatement("select * from server ");
			Ma_Delete=con.prepareStatement("DELETE FROM server WHERE SERVER_ID = ?");
			User_Delete=con.prepareStatement("DELETE FROM dashmember_info WHERE AID = ?");
			Update_dash=con.prepareStatement("UPDATE dashmember_info  SET  NAME = ? , EMAIL = ? , MOB_NO = ? , COUNTRY = ? , CITY = ? , L_NAME = ? , ACCESS_KEY = ? , SECRET_KEY = ? WHERE AID = ?");	
			update_Server=con.prepareStatement("update server set ASSIGNED_TO = replace(ASSIGNED_TO, ? , ? ) where ASSIGNED_TO = ? ");	
			get_id=con.prepareStatement("SELECT MAX(AID) FROM dashmember_info");
			Add_User=con.prepareStatement("INSERT INTO dashmember_info (NAME,EMAIL,MOB_NO,PASSWORD,COUNTRY,PRIVILIGE,CITY,L_NAME,ACCESS_KEY,SECRET_KEY,AID) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
			Aid_Search=con.prepareStatement("select * from dashmember_info where AID = ?  ");
			Delete_Server=con.prepareStatement("DELETE FROM server WHERE ASSIGNED_TO = ?");
		}
		catch(Exception e)
		{
		   e.printStackTrace();
		}
	}
	
	
}
