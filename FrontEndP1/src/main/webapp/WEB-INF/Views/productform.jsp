<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>
	<!--  p=new Product(), initially all the properties will have default values
	var url="/admin/addproduct"
	 -->
	<c:url value="/admin/addproduct" var="url"></c:url>
	<form:form modelAttribute="product" action="${url }" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td></td>
				<!-- user need not give value for id, auto generation -->
				<td><form:hidden path="id"></form:hidden></td>
			</tr>
			<tr>
				<td>Enter Product Name
				</td>
				<td><form:input path="productName" placeholder="*"></form:input>
				<form:errors path="productName" cssStyle="color:red"></form:errors></td>
			</tr>
			<tr>
			<td>Enter Product Description</td>
			<td><form:textarea path="productDesc" placeholder="*"></form:textarea>
			<form:errors path="productDesc" cssStyle="color:red"></form:errors>
			</td></tr>
			<tr>
			<td>Enter Price</td>
			<td><form:input path="price"></form:input>
			<form:errors path="price" cssStyle="color:red"></form:errors>
			</td></tr>
			<tr><td>Enter Quantity</td>
			<td><form:input path="quantity"></form:input>
			<form:errors path="quantity" cssStyle="color:red"></form:errors></td></tr>
			<tr><td>select category</td>
			<td><form:select path="category.id">
			<c:forEach items="${categories }" var="c">
			<form:option value="${c.id }">${c.categoryName }</form:option></c:forEach></form:select></td></tr>
			<!--  <td><form:select path="category.id">
			<form:option value="200">Musical instruments</form:option>
			<form:option value="201">Jewellary</form:option>
             <form:option value="202">Cosmetics</form:option>
             <form:option value="203">Clothing</form:option>
             </form:select></td></tr>-->
             <tr><td>Upload image</td><td>
			<form:input path="image" type="file"/>
			</td></tr>
			<tr>
			<td></td>
			<td><input type="submit" value="Add Product"></td>
			</tr>


		</table>

	</form:form>
	</div>
</body>
</html>

