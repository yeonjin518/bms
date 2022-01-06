<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script>
	
	function fn_modify_member_info(attribute) {
		
		var value = $("#memberPw").val();
		if(value == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		if(value != $("#checkPw").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		$.ajax({
			type : "post",
			url : "${contextPath}/mypage/changePassword.do",
			data : {
				attribute : attribute,
				value     : value,
				memberId  : "${memberId}",
			},
			success : function() {
				alert("회원 정보를 수정했습니다.");
				location.href="${contextPath}/member/loginForm.do";
			}
		}); 
		
	}
	
</script>
<style>
	td {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
	<c:choose>
	  <c:when test="${memberId eq null }">
		  <script>
		  	alert("아이디가 없습니다.");
		  	history.go(-1);
		  </script>
	  </c:when>
	  <c:when test="${find eq 'id' }">
		<h1>아이디 / 비밀번호 찾기</h1>
		<div class="tab_container">
		  <div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">아이디 찾기</a></li>
			</ul>
			<div class="tab_container">
			  <div class="tab_content" id="tab1">
				<table class="table table-hover">
					<tr>
						<td align="center">
							<p>고객님의 아이디는 </p>
						</td>
						<td>
							<c:forEach var="member" items="${memberId }">
								<p>${member }</p>
							</c:forEach>
						</td>
						<td align="center">
							<p>입니다.</p>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="right"><input type="button" class="btn btn-primary btn-sm" value="비밀번호 찾기" onClick="location.href='${contextPath}/member/findAccount.do'"></td>
					</tr>
				  </table>	
				</div>
			  </div>
			</div>
		</div>
	  </c:when>
	  <c:when test="${find eq 'pw' }">
	    <h1>아이디 / 비밀번호 찾기</h1>
		<div class="tab_container">
		  <div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">비밀번호 찾기</a></li>
			</ul>
			<div class="tab_container">
			  <div class="tab_content" id="tab1">
				<table class="table table-hover">
					<tr>
						<td align="center">새 비밀번호</td>
						<td>
						  <input id="memberPw" name="memberPw" type="password" class="form-control" />
						</td>
					</tr>
					<tr>
						<td align="center">새 비밀번호 확인</td>
						<td>
						  <input id="checkPw" name="checkPw" type="password" class="form-control"  />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="button" class="btn btn-primary btn-sm" value="비밀번호 변경" onClick="fn_modify_member_info('memberPw')"></td>
					</tr>
				  </table>	
				</div>
			  </div>
			</div>
		</div>
	  </c:when>
	</c:choose>
</body>
 