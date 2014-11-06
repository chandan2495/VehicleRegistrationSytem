<%@page import="java.sql.*,java.util.*"%> 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Register</title>

</head>

<body>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

String vehicleno=null;

int registerno=Integer.parseInt(request.getParameter("regno"));


String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/vehicle";

String user = "root";


String password = "";
ResultSet rsa=null;

Class.forName(driverName);

con = DriverManager.getConnection(url, user, password);
Statement st=con.createStatement();
rsa = st.executeQuery("select * from foundlist where regno='"+registerno+"'");

if(rsa.next())
{
 out.println("Found");
}
else
    out.println("Not found");
%>
<p> Click here for <a href="home.html">Home</a> Page.</p>
<%
//response.sendRedirect("home.html");
%>

</body>
</html>