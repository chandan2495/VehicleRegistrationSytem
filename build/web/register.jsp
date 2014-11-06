<%@page import="java.sql.*,java.util.*"%> 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Register</title>
<link rel="stylesheet" href="style.css"/>
</head>

<body>
    <%! int regno=0; %>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

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
int i=st.executeUpdate("insert into register_table (regno,vehicleno,wheels,model,rtono,ownername,owneremail,ownerno,owneraddress) values(NULL,'"+vehicleno+"','"+wheels+"','"+model+"','"+rtono+"','"+ownername+"','"+owneremail+"','"+ownerno+"','"+owneraddress+"')");
      
rsa = st.executeQuery("select regno from register_table where vehicleno='"+vehicleno+"'");

if(rsa.next())
{
    regno=rsa.getInt("regno");
    out.println("Your registration number is : "+ regno);
}%>

<p> Click here for <a href="home.html">Home</a> Page.</p>
<%
//response.sendRedirect("home.html");
%>

</body>
</html>