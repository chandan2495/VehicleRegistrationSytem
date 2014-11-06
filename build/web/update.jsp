<%@page import="java.sql.*,java.util.*"%> 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Register</title>

</head>

<body>
    <%! int regno=0; %>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

regno=Integer.parseInt(request.getParameter("regno"));

String vehicleno=request.getParameter("vehicleno");

int wheels=Integer.parseInt(request.getParameter("wheels"));

String model=request.getParameter("model");

int rtono=Integer.parseInt(request.getParameter("rtono"));

String ownername=request.getParameter("ownername");

String owneremail=request.getParameter("owneremail");

String ownerno=request.getParameter("ownerno");

String owneraddress=request.getParameter("owneraddress");

String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/vehicle";

String user = "root";


String password = "";
ResultSet rsa=null;

Class.forName(driverName);

con = DriverManager.getConnection(url, user, password);
Statement st=con.createStatement();
int i=st.executeUpdate("update register_table set regno='"+regno+"',vehicleno='"+vehicleno+"',wheels='"+wheels+"',model='"+model+"',rtono='"+rtono+"',ownername='"+ownername+"',owneremail='"+owneremail+"',ownerno='"+ownerno+"',owneraddress='"+owneraddress+"' where regno='"+regno+"' ");

out.println("Successfully Updated!");
%>

<p> Click here for <a href="home.html">Home</a> Page.</p>
<%
//response.sendRedirect("home.html");
%>

</body>
</html>