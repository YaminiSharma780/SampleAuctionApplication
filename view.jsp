<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="com.mvc.util.DBConnection" %>  
<%@ page import="javax.servlet.http.HttpServletRequest" %>
        
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>auction.com</title>
<body>
<div class="row">
<%!
	int sno=0;
    String name=null;
	String photo_url=null;
	String sellerprice=null;
	String bestbiddingprice=null;
	String timetosell=null;
	String about=null;
	int flag=0;
	
%>
<%	
	int sno=Integer.parseInt(request.getParameter("sno")); 	
 	System.out.println("Sno : "+sno);
	try {
	Connection con = DBConnection.createConnection();
	PreparedStatement ps=con.prepareStatement("select sno,name,photo_url,sellerprice,bestbiddingprice,timetosell,flag,about from master where sno="+sno);
	String imagePathName="";
	ResultSet rs=ps.executeQuery();
	
	while(rs.next() ){
	sno=rs.getInt(1);
	name=rs.getString(2);
	photo_url=rs.getString(3);
	sellerprice=rs.getString(4);
	bestbiddingprice=rs.getString(5);
	timetosell=rs.getString(6);
	flag=rs.getInt(7);
	about=rs.getString(8);
 	
	imagePathName=photo_url+name;
%>
   
  		<img src="<%=request.getContextPath()+""+imagePathName%>" style="width:300px;height:200px;" >
  		<p>Seller______Price :<%=sellerprice%></p>
  		<p>Highest_Bidding_Price :<%=bestbiddingprice%></p>
  		<p>Remaining__Time :<%=timetosell%></p>  
  		<p>Description :<%=about%></p>   		

<%}%>

<%	}catch(Exception e){			
			e.printStackTrace();
}
%>
</div> 
</body>
</html>