<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />	
<!DOCTYPE html>
<meta charset="utf-8">
<head>
<script>

	$().ready(function(){
		$("#select_email").change(function(){
			$("#email2").val($("#select_email option:selected").val());
		});

	});
	
	function en_find_id(r_form_name, r_find_method){
		var frm_find_account = r_form_name;
		t_hp1 = frm_find_account.hp1;
		t_hp2 = frm_find_account.hp2;
		t_hp3 = frm_find_account.hp3;
		t_email1 = frm_find_account.email1;
		t_email2 = frm_find_account.email2;
		t_email3 = frm_find_account.email3;
		
		if(r_find_method.value == 'find_hp'){
			t_hp1.disabled = false;
			t_hp2.disabled = false;
			t_hp3.disabled = false;
			t_email1.disabled = true;
			t_email2.disabled = true;
			t_email3.disabled = true;
		}
		else{
			t_email1.disabled = false;
			t_email2.disabled = false;
			t_email3.disabled = false;
			t_hp1.disabled = true;
			t_hp2.disabled = true;
			t_hp3.disabled = true;
		}
	}
	
	function fn_find_account(r_form_name){
		
		if(r_form_name.name == "frm_find_account1"){
			if($("#findHp1").prop("checked")){
				if($("#hp2").val() == "" || $("#hp3").val() == ""){
					alert("휴대폰 번호를 입력해주세요.");
					return false;
				}
			} else if($("#findEmail1").prop("checked")){
				if($("#email1").val() == "" || $("#email2").val() == ""){
					alert("이메일을 입력해주세요.");
					return false;
				}
			}
		}
		
		if(r_form_name.name == "frm_find_account2"){
			if($("#memberId").val() == ""){
				alert("아이디를 입력해주세요.");
				return false;
			}
			if($("#findHp2").prop("checked")){
				if($("#hp2").val() == "" || $("#hp3").val() == ""){
					alert("휴대폰 번호를 입력해주세요.");
					return false;
				}
			} else if($("#findEmail2").prop("checked")){
				if($("#email1").val() == "" || $("#email2").val() == ""){
					alert("이메일을 입력해주세요.");
					return false;
				}
			}
		}
		
		return true;
	}
	
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
		<h1>아이디 / 비밀번호 찾기</h1>
		<div class="tab_container">
		<div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">아이디 찾기</a></li>
				<li><a href="#tab2">비밀번호 찾기</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
				<form name="frm_find_account1" action="${contextPath}/member/findAccount.do" method="post" onSubmit="return fn_find_account(this)">
					<table class="table table-hover">
						<colgroup>
							<col width="20%">
							<col width="60%">
						</colgroup>
						<tr>
							<td align="center"><input id="findHp1" class="findHp" name="findId" type="radio" value="find_hp" onclick="en_find_id(frm_find_account1, this)" checked><label for="findHp1">휴대폰으로 찾기</label></td>
							<td>
								<select class="form-control" id="hp1" name="hp1" style="display:inline; width:70px; padding:0">
									<option selected value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> - 
								<input class="form-control"  size="10px"  type="text" id="hp2" name="hp2" style="display:inline; width:100px; padding:0"> - 
								<input class="form-control"  size="10px"  type="text" id="hp3" name="hp3" style="display:inline; width:100px; padding:0">
							</td>
						</tr>
						<tr>
							<td><input id="findEmail1" class="findEmail" name="findId" type="radio" value="find_email" onclick="en_find_id(frm_find_account1, this)"><label for="findEmail1">이메일로 찾기</label></td>
							<td>
					        	<input class="form-control"  size="10px"  type="text" id="email1" name="email1" style="display:inline; width:100px; padding:0" disabled> @ 
									<input class="form-control"  size="10px"  type="text" id="email2" name="email2" style="display:inline; width:100px; padding:0" disabled>
									<select class="form-control" id="select_email" name="email3" style="display:inline; width:100px; padding:0" disabled>
										 <option value="" selected>직접입력</option>
										 <option value="gmail.com">gmail.com</option>
										 <option value="naver.com">naver.com</option>
										 <option value="daum.net">daum.net</option>
										 <option value="nate.com">nate.com</option>
									</select>
					        </td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="submit" class="btn btn-primary btn-sm" value="아이디 찾기"></td>
						</tr>
					</table>	
					<input type="hidden" name="find" value="id">
				</form>	
				</div>
				<div class="tab_content" id="tab2">
					<div class="form-group">
						<form name="frm_find_account2" action="${contextPath}/member/findAccount.do" method="post" onSubmit="return fn_find_account(this)">
							<table class="table table-hover">
								<colgroup>
									<col width="20%">
									<col width="60%">
								</colgroup>
								<tr>
									<td align="center"><label for="memberId">아이디 입력</label></td>
									<td><input class="form-control" id="memberId" name="memberId" type="text" placeholder="아이디를 입력하세요." /></td>
								</tr>
								<tr>
									<td align="center"><input id="findHp2" class="findHp" name="findPw" type="radio" value="find_hp" onclick="en_find_id(frm_find_account2, this)" checked><label for="findHp2">휴대폰으로 찾기</label></td>
									<td>
										<select class="form-control" id="hp1" name="hp1" style="display:inline; width:70px; padding:0">
											<option selected value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select> - 
										<input class="form-control"  size="10px"  type="text" id="hp2" name="hp2" style="display:inline; width:100px; padding:0"> - 
										<input class="form-control"  size="10px"  type="text" id="hp3" name="hp3" style="display:inline; width:100px; padding:0">
									</td>
								</tr>
								<tr>
									<td><input id="findEmail2" class="findEmail" name="findPw" type="radio" value="find_email" onclick="en_find_id(frm_find_account2, this)"><label for="findEmail2">이메일로 찾기</label></td>
									<td>
							        	<input class="form-control"  size="10px"  type="text" id="email1" name="email1" style="display:inline; width:100px; padding:0" disabled> @ 
											<input class="form-control"  size="10px"  type="text" id="email2" name="email2" style="display:inline; width:100px; padding:0" disabled>
											<select class="form-control" id="select_email" name="email3" style="display:inline; width:100px; padding:0" disabled>
												 <option value="" selected>직접입력</option>
												 <option value="gmail.com">gmail.com</option>
												 <option value="naver.com">naver.com</option>
												 <option value="daum.net">daum.net</option>
												 <option value="nate.com">nate.com</option>
											</select>
							        </td>
								</tr>
								<tr>
									<td colspan="2" align="right"><input type="submit" class="btn btn-primary btn-sm" value="비밀번호 찾기"></td>
								</tr>
							</table>
							<input type="hidden" name="find" value="pw">
						</form>
				    </div>
				</div>
			</div>
			</div>
		</div>
</body>
 