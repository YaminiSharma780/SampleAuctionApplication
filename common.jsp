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
<body>
<div class="row">

<%!
int id=0;
int sno=0;
String name=null;
String photo_url=null;
String sellerprice=null;
String bestbiddingprice=null;
String timetosell=null;
int flag=0;
%>
<%  String s=request.getParameter("items");
    if (s !=null)
    {
    System.out.println("Selected Content :"+s);
    }
%>
<%	
try {
Connection con = DBConnection.createConnection();
PreparedStatement ps=con.prepareStatement("select sno,id,name,photo_url,sellerprice,bestbiddingprice,timetosell,flag from master where id="+s);
String imagePathName="";
ResultSet rs=ps.executeQuery();

while(rs.next() ){
sno=rs.getInt(1);
id=rs.getInt(2);
System.out.println("id :"+id);
name=rs.getString(3);
photo_url=rs.getString(4);
sellerprice=rs.getString(5);
bestbiddingprice=rs.getString(6);
timetosell=rs.getString(7);
flag=rs.getInt(8);
	
imagePathName=photo_url+name;
%>   
		<a href="ViewController?sno=<%=sno%>"><img src="<%=request.getContextPath()+""+imagePathName%>" style="width:300px;height:200px;" ></a>
		<p>Seller______Price :<%=sellerprice%></p>
		<p>Bidding____Price :<%=bestbiddingprice%></p>
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
</head>
<body>
</body>
</html>