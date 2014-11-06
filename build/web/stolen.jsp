<%@page import="java.sql.*,java.util.*"%> 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Register</title>

</head>

<body>
    
    <%! int regno=0;
    %>
    
    <%! int vehicleno=0;
    %>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

String vehicleno=null;

int registerno=Integer.parseInt(request.getParameter("registerno"));

String date=request.getParameter("date");



String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/vehicle";

String user = "root";


String password = "";
ResultSet rsa=null;

Class.forName(driverName);

con = DriverManager.getConnection(url, user, password);
Statement st=con.createStatement();
rsa = st.executeQuery("select * from register_table where regno='"+registerno+"'");

if(rsa.next())
{
    vehicleno=rsa.getString("vehicleno");
 int i=st.executeUpdate("insert into stolenlist (stolenid,registerno, vehicleno,date) values(NULL,'"+registerno+"','"+vehicleno+"','"+date+"')");
 
 response.sendRedirect("home.html");
}
else
{
    response.sendRedirect("stolen.html");
}
%>
<%
//response.sendRedirect("home.html");
%>

</body>
</html>