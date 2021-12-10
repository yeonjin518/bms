<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<h1>새제품 이미지 등록창</h1>
	<br>
	<form action="${contextPath}/admin/goods/addNewGoods.do" method="post"	enctype="multipart/form-data">
		<table>
			<tr>
				<td>메인 이미지</td>
				<td><input type="file" name="mainImage"><br></td>
			</tr>
			<tr>
			 <td><br></td>
			</tr>
			<tr>
				<td>상세 이미지1</td>
				<td><input type="file" name="detailImage1"><br></td>
			</tr>
			<tr>
			 <td><br></td>
			</tr>
			<tr>
				<td>상세 이미지2:</td>
				<td><input type="file" name="detailImage2"><br></td>
			</tr>
			<tr>
			 <td><br></td>
			</tr>
			<tr>
				<td>상세 이미지3:</td>
				<td><input type="file" name="detailImage3"><br></td>
			</tr>
			<tr>
			 <td><br></td>
			</tr>
			<tr>
				<td colspan="2"><br><input type="submit" value="제품 이미지 등록하기"></td>
			</tr>
		</table>
	</form>
</body>
</html>
