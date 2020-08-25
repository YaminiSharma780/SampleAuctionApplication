<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="com.mvc.util.DBConnection" %>  
    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>auction.com</title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
<body>
<div class="container">  
	<div class="pull-right">
    	<div class="btn-group">
        	<button class="btn btn-primary btn-md center-block" Style="width: 100px;" onclick="location.href= 'welcome.jsp';">HOME</button>&nbsp;
        	<button class="btn btn-primary btn-md center-block" Style="width: 100px;" onclick="location.href= 'login.jsp';">LOGOUT</button>
     	</div>
	</div>
	<div class="pull-left">
	<%!
	int userid=0;
	String username=null;
	String pass=null;
	String firstname=null;
	String lastname=null;
	String gender=null;
	String education=null;
	String languages=null;
	String biddingpriceUser=null;
	int sno=0;
	
	String name=null;
	String photo_url=null;
	String sellerprice=null;
	String bestbiddingprice=null;
	String timetosell=null;
	String about=null;
	int flag=0;
	int id=0;
	%>
	<%	
	System.out.println("Inside user.jsp");
	
	String username=request.getParameter("username"); 
	System.out.println("username :"+username);
	String pass=request.getParameter("pass"); 	
	System.out.println("password :"+pass);
	
	try {
	Connection con = DBConnection.createConnection();
	
	PreparedStatement ps=con.prepareStatement("select * from"+
	" Student INNER JOIN master on Student.sno=master.sno where username='"+username+"' and pass='"+pass+"'");
	
	String imagePathName="";
	ResultSet rs=ps.executeQuery();
	
	while(rs.next() ){
	userid=rs.getInt(1);
	username=rs.getString(2);
	pass=rs.getString(3);
	firstname=rs.getString(4);
	lastname=rs.getString(5);
	gender=rs.getString(6);
	education=rs.getString(7);
	languages=rs.getString(8);
	sno=rs.getInt(9);
	biddingpriceUser=rs.getString(10);
	
	sno=rs.getInt(11);
	id=rs.getInt(12);
	name=rs.getString(13);
	photo_url=rs.getString(14);
	sellerprice=rs.getString(15);
	bestbiddingprice=rs.getString(16);
	timetosell=rs.getString(17);
	flag=rs.getInt(18);
	about=rs.getString(19);
	
	imagePathName=photo_url+name;
	%>	    <h3 style="color:#0288D1;">Welcome :<%=firstname%>&nbsp;<%=lastname%></h3>  
			<a href="ViewController?sno=<%=sno%>"><img src="<%=request.getContextPath()+""+imagePathName%>" style="width:300px;height:200px;" ></a>
			<p>Seller______Price :<%=sellerprice%></p>
			<p>Your_Bidding_Price :<%=biddingpriceUser%></p>
			<p>Remaining__Time :<%=timetosell%></p>   	
				 		
	<%
	}
	%>
	<%
	}catch(Exception e){			
			e.printStackTrace();
	}
	%>
	</div> 
</div>
</body>
</html>