<%@page import="java.sql.*,java.util.*"%> 

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Update</title>
<link rel="stylesheet" href="style.css"/>
</head>

<body>
    <center>
        <h1>Stolen Vehicle Tracing</h1>
        <hr><hr>
        <form method="post" action="update.jsp">
          
    <%! int regno=0; %>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

String vehicleno="";
int wheels=0;
String model="";
int rtono=0;
String ownername="";
String owneremail="";
String ownerno="";
String owneraddress="";

/*String vehicleno=request.getParameter("vehicleno");

int wheels=Integer.parseInt(request.getParameter("wheels"));

String model=request.getParameter("model");

int rtono=Integer.parseInt(request.getParameter("rtono"));

String ownername=request.getParameter("ownername");

String owneremail=request.getParameter("owneremail");

String ownerno=request.getParameter("ownerno");

String owneraddress=request.getParameter("owneraddress"); */

regno=Integer.parseInt(request.getParameter("registerno"));

String driverName = "com.mysql.jdbc.Driver";

String url = "jdbc:mysql://localhost:3306/vehicle";

String user = "root";


String password = "";
ResultSet rsa=null;

Class.forName(driverName);

con = DriverManager.getConnection(url, user, password);
Statement st=con.createStatement();
//int i=st.executeUpdate("insert into register_table (regno,vehicleno,wheels,model,rtono,ownername,owneremail,ownerno,owneraddress) values(NULL,'"+vehicleno+"','"+wheels+"','"+model+"','"+rtono+"','"+ownername+"','"+owneremail+"','"+ownerno+"','"+owneraddress+"')");
      
rsa = st.executeQuery("select * from register_table where regno='"+regno+"'");

if(rsa.next())
{
 vehicleno=rsa.getString("vehicleno");

wheels=rsa.getInt("wheels");

model=rsa.getString("model");

rtono=rsa.getInt("rtono");

ownername=rsa.getString("ownername");

owneremail=rsa.getString("owneremail");

ownerno=rsa.getString("ownerno");

owneraddress=rsa.getString("owneraddress");   
%>
<input type="hidden"  name="regno" value="<%=regno %>"/>
<table>
<tr>
    <td>Vehicle Number:</td><td><input type='text' name="vehicleno" value="<%=vehicleno %>"/></td>
                </tr>
                <tr>
                    <td>Enter number of wheels:</td><td><input type='text' name="wheels" value="<%=wheels %>"/>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle type Model:</td><td><input type='text' name="model" value="<%=model %>"/></td>
                </tr>
                <tr>
                    <td>RTO number </td><td><input type='text' name="rtono" value="<%=rtono %>"/>
                    </td>
                </tr>
                <tr><td>Enter Owner's Details</td></tr>
                <tr>
                    <td>Owner's Name:</td><td><input type='text' name="ownername" value="<%=ownername %>"/></td>
                </tr>
                <tr>
                    <td>Owner's E-maild id:</td><td><input type='text' name="owneremail" value="<%=owneremail %>"/></td>
                </tr>
                <tr>
                    <td>Owner's phone number:</td><td><input type='text' name="ownerno" value="<%=ownerno %>"/></td>
                </tr>
                <tr>
                    <td>Owner's Address:</td><td><input type="text" name="owneraddress" value="<%=owneraddress %>"/></td>
                </tr>
                
                <tr>
                    <td><input type="submit" value="Submit"/></td><td><input type='reset' value="Reset"/></td>
                </tr>
<% 
}
else
{
    out.println("Not a valid register number");
%>

<p> Click here for <a href="home.html">Home</a> Page.</p>
<%
}
%>
<%
//response.sendRedirect("home.html");
%>
            </table>
        </form>
</body>
</html>