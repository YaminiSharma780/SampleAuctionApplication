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
<h2>Login Here..</h2>

<div class="container">  
  <form class="form-horizontal" action="LoginController" method="post" style="width:300px">  
  
	<div class="form-group">  
      	<div class="col-sm-10">  
        	Username:<input type="text" class="form-control" name="username">  
      	</div>  
    </div>  
    <div class="form-group">  
      	<div class="col-sm-10">            
        	Password:<input type="password" class="form-control" name="pass">  
      	</div>  
    </div>  
  	<div class="form-group">
  		<div class="pull-left">          
      		<div class="col-sm-offset-2 col-sm-10">  
        		<button type="submit" class="btn btn-primary" value="Login">Login</button>  
      		</div>  
      	</div>
  	</div>
    <% System.out.println("Inside login.jsp"); %>  
  </form>  
</div>  
</body>
</html>