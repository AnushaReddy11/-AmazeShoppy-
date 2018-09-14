<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device width,intial scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- JQuery -->
    <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<div class="container">
<nav class="navbar navbar-default">
<div class="navbar header">
<a href="#"class="navbar-brand">REDDYGT</a>
<button type="button" class="navbar-toggle collapsed" 
   data-toggle="collapse" data-target="#navbardemo" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
</div>

<div class="collapse navbar-collapse" id="navdemo">

<ul class="nav navbar-nav">
<li><a href='<c:url value='/Home'></c:url>' class="fontSize">Home</a></li>
<li><a href="<c:url value='/AboutUs'></c:url>" >AboutUs</a></li>
<li><a href="<c:url value='/all/getallproducts'></c:url>">Browse all products</a>
				
<li>
<li class="dropdown"><a href="#"class="dropdown-toggle"data-toggle="dropdown">select by category<span class="caret"></span></a>
<ul class="dropdown-menu">
<c:forEach items="${categories }" var="category">
<li><a href="<c:url value='/all/searchByCategory?searchCondition=${category.categoryName }'></c:url>">${category.categoryName }</a>
</li></c:forEach>
<!--<li><a href="#">Musical Instruments</a><li>
<li><a href="#">Jewellery</a><li>
<li><a href="#">Cosmetics</a><li>
<li><a href="#">Clothing</a><li>-->
<li>
<a href="<c:url value='/all/searchByCategory?searchCondition=All'></c:url>">All</a>
</li>

</ul>

        <security:authorize access="hasRole('ROLE_ADMIN')">
			   <li><a href="<c:url value='/admin/getproductform'></c:url>">Add Product</a></li>
			   </security:authorize>
			   
			   <security:authorize access="hasRole('ROLE_USER')">
			   <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
			   </security:authorize>
			   
			   <c:if test="${pageContext.request.userPrincipal.name==null }">
				<li><a href="<c:url value='/all/registrationform'></c:url>">Sign Up</a></li>
				<li><a href="<c:url value='/login'></c:url>">Sign In</a></li>
				</c:if>
				
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
				<li><a href="#">Welcome ${pageContext.request.userPrincipal.name }</a></li>
				<li><a href="<c:url value='/j_spring_security_logout'></c:url>">Sign out</a></li>
			    </c:if>
			



</ul>
</div>
</nav>
</div>
</body>
</html>