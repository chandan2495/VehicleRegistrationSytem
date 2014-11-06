<%@page import="java.sql.*,java.util.*"%> 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Second Hand</title>
<link rel="stylesheet" href="style.css"/>

</head>

<body>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

String vehicleno=null;

vehicleno=request.getParameter("vehicleno");


String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/vehicle";

String user = "root";


String password = "";
ResultSet rsa=null;

Class.forName(driverName);

con = DriverManager.getConnection(url, user, password);
Statement st=con.createStatement();
rsa = st.executeQuery("select * from stolenlist where regno=(select regno from register_table where vehicleno='"+vehicleno+"')");

if(rsa.next())
{
  int registerno=rsa.getInt("regno");
          
 int i=st.executeUpdate("insert into foundlist (regno,remark) values('"+registerno+"',NULL)");

 out.println("Can't purchase this vehicle (Stolen)");
}
else{
    out.println("No complaints against your vehicle you can purchase this vehicle to avail benefits of the site register the vehicle after purchase.");
}
%>
<p> Click here for <a href="home.html">Home</a> Page.</p>
<%
//response.sendRedirect("home.html");
%>

</body>
</html>