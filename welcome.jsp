<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="com.mvc.util.DBConnection" %> 
        
<!DOCTYPE html PUBLIC>
<html>
<head>

  <meta http-equiv="Content-Type" content="text/javascript; charset=ISO-8859-1">
  
<title>auction.com</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</head>

<style>
body {margin:0;font-family:Arial}
.topnav {
  overflow: hidden;
  background-color: #5DADE2;
}
.topnav a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}
.active {
  background-color: #4CAF50;
  color: black;
}
.topnav .icon {
  display: none;
}
.dropdown {
  float: left;
  overflow: hidden;
  
}
.dropdown .dropbtn {
  font-size: 17px;    
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color:#5DADE2   ;
  font-family: inherit;
  margin: 0;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}
.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
.topnav a:hover, .dropdown:hover .dropbtn {
  background-color: #555;
  color: white;
}

.dropdown-content a:hover {
  background-color: #ddd;
  color: black;
}
.dropdown:hover .dropdown-content {
  display: block;
}
@media screen and (max-width: 600px) {
  .topnav a:not(:first-child), .dropdown .dropbtn {
    display: none;
  }
  .topnav a.icon {
    float: right;
    display: block;
  }
}
@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
  .topnav.responsive .dropdown {float: none;}
  .topnav.responsive .dropdown-content {position: relative;}
  .topnav.responsive .dropdown .dropbtn {
    display: block;
    width: 100%;
    text-align: left;
  }
}
footer {
    display: flex;
    justify-content: center;
    padding: 5px;
    background-color: #5DADE2;
    color: #fff;
}
</style>

<body>
<div class="topnav" id="myTopnav">
  <h2 style="color:white;"><img src="${pageContext.request.contextPath}/images/scene.jpg" align="top"style="width:100px;height:70px;">   Auction.com</h2>
  <a href="startIndex.jsp">HOME</a>
  <div class="dropdown">
    <button class="dropbtn">ITEMS 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">  
 	<form class="" action="itemController" method="get">
 		<select name="items">
    		<option value="1">Electronic Gadgets</option>
    		<option value="2">Books</option>
    		<option value="3">Painting</option>
    		<option value="4">Idol</option>
    		<option value="5">Automobile</option>
    		<option value="6">Land</option>
    		<option value="7">Building</option>    		
  		</select>
  	</form>  	
  	</div>	
  </div> 
  <a href="login.jsp">LOGIN</a>
  <a href="register.html">REGISTER</a>
  <a href="contact.html">CONTACT</a>
  <a href="about.html">ABOUT</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>

<div class="container">
<%!
	int sno=0;
	int id=0;
    String name=null;
	String photo_url=null;
	String sellerprice=null;
	String bestbiddingprice=null;
	String timetosell=null;
	int flag=0;
%>
<%	
	try {
	Connection con = DBConnection.createConnection();
	PreparedStatement ps=con.prepareStatement("select sno,id,name,photo_url,sellerprice,bestbiddingprice,timetosell,flag from master where flag=1");
	String imagePathName="";
	ResultSet rs=ps.executeQuery();
 
    while(rs.next() ){
	sno=rs.getInt(1);
	System.out.println("sno :"+sno);
	id=rs.getInt(2);
	System.out.println("id :"+id);	
	name=rs.getString(3);
	photo_url=rs.getString(4);
	sellerprice=rs.getString(5);
	bestbiddingprice=rs.getString(6);
	timetosell=rs.getString(7);
	flag=rs.getInt(8);
 	
	imagePathName=photo_url+name;
	
%> <table>
	<tr>	
		<td><a href="ViewController?sno=<%=sno%>"><img src="<%=request.getContextPath()+""+imagePathName%>" style="width:300px;height:200px;" ></a></td>
  		<td>Bidding____Price :<%=bestbiddingprice%><br></br></td>
  		<td>Remaining__Time :<%=timetosell%><br></br></td>   
  	</tr>
   </table>	
   	
<% }%>

<%
}catch(Exception e){			
			e.printStackTrace();
}
%>
</div> 
<script>
function myFunction() {
  document.getElementById("items").classList.toggle("show");
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
    <footer>
    <footer> 
            <nav> 
                <p> 
                    <a href= "https://github.com/YaminiSharma780/SampleAuctionApplication">Github Repository</a>|  
                    <a href= "https://github.com/YaminiSharma780/githubuser.github.io/blob/master/README.md">About Developer</a>|  
                </p> 
            </nav> 
            <p>Auction.com (All rights reserved) Yamini Sharma</p> 
        </footer> 
    </footer>
</head>
<body>
</body>
</html>