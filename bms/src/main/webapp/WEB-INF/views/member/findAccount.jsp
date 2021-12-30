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

  
		function en_find_id(r_find){
			var frm_find_account = document.frm_find_account;
			t_hp1 = frm_find_account.hp1;
			t_hp2 = frm_find_account.hp2;
			t_hp3 = frm_find_account.hp3;
			t_email1 = frm_find_account.email1;
			t_email2 = frm_find_account.email2;
			t_email3 = frm_find_account.email3;
			
			if(r_find.value == 'find_hp'){
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
	
	});
</script>
<style>
	td:first-child {
		text-align: center;
		font-weight: bold;
	}
</style>
</head>
<body>
	<form name="frm_find_account" action="${contextPath}/admin/goods/addNewGoods.do" method="post"  enctype="multipart/form-data">
		<h1>아이디 / 비밀번호 찾기</h1>
		<div class="tab_container">
		<div class="tab_container" id="container">
			<ul class="tabs">
				<li><a href="#tab1">아이디 찾기</a></li>
				<li><a href="#tab2">비밀번호 찾기</a></li>
			</ul>
			<div class="tab_container">
				<div class="tab_content" id="tab1">
					<table class="table table-bordered table-hover">			
						<tr>
							<td width=200><input id="findHp" name="findId" type="radio" value="find_hp" onclick="en_find_id(this)" checked><label for="findHp">휴대폰으로 찾기</label></td>
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
								<input class="form-control"  size="10px"  type="text" id="hp3" name="hp3" style="display:inline; width:100px; padding:0"><br><br>
					        </td>
						</tr>
						<tr>
							<td><input id="findEmail" name="findId" type="radio" value="find_email"><label for="findEmail" onclick="en_find_id(this)">이메일로 찾기</label></td>
							<td>
					        	<input class="form-control"  size="10px"  type="text" id="email1" name="email1" style="display:inline; width:100px; padding:0" disabled> @ 
									<input class="form-control"  size="10px"  type="text" id="email2" name="email2" style="display:inline; width:100px; padding:0" disabled>
									<select class="form-control" id="select_email" name="email3" style="display:inline; width:100px; padding:0" disabled>
										 <option value="none" selected>직접입력</option>
										 <option value="gmail.com">gmail.com</option>
										 <option value="naver.com">naver.com</option>
										 <option value="daum.net">daum.net</option>
										 <option value="nate.com">nate.com</option>
									</select><br><br>
					        </td>
						</tr>
					</table>	
				</div>
				<div class="tab_content" id="tab2">
					<div class="form-group">
						<textarea rows="50" cols="80" class="form-control" id="goodsContentsOrder" name="goodsContentsOrder"></textarea>
				    	<script>CKEDITOR.replace('goodsContentsOrder');</script>
				    </div>
				</div>
			</div>
			<p align="right">
				  <input type="button" value="등록하기" class="btn btn-outline-primary btn-sm" onClick="fn_add_new_goods(this.form)">
			</p>
			</div>
		</div>
	</form>	
</body>
 