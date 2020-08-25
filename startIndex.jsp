<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>auction.com</title>
<style>
.container {
  position: relative;
  width: 100%;
  max-width: 400px;
}

.container .btn {
  position: absolute;
  top:30%;
  left:136%;
  display: inline-block;
  border-radius: 4px;
  background-color: #5C6BC0;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 30px;
  width: 300px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
  }
.btn span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.btn span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.btn:hover span {
  padding-right: 25px;
}
.btn:hover span:after {
  opacity: 1;
  right: 0;
}

</style>
</head>
<body style="background-color:black;">
<div class="container">
  <img src="${pageContext.request.contextPath}/images/scene.jpg" style="width:1345px;height:800px;">
  <a href="welcomeController"><button class="btn" style="vertical-align:middle"><span>WELCOME</span></button></a>
  
</div>
</body>
</html>
