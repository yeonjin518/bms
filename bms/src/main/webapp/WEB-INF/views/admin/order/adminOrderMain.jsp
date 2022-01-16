<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">
<script>

	function search_order_list(fixedSearchPeriod) {
		location.href = "${contextPath}/admin/order/adminOrderMain.do?fixedSearchPeriod=" + fixedSearchPeriod;
	}
	
	
	function fn_modify_order_state(orderId,select_id){
		
		var s_deliveryState = document.getElementById(select_id);
	    
		var index = s_deliveryState.selectedIndex;
	    var value = s_deliveryState[index].value;
		 
		$.ajax({
			type : "post",
			url : "${contextPath}/admin/order/modifyDeliveryState.do",
			data : {
				orderId : orderId,
				deliveryState : value
			},
			success : function() {
				alert("주문 정보를 수정했습니다.");
				location.href = "${contextPath}/admin/order/adminOrderMain.do";
			}
					
		}); 		
	}
	
	function fn_enable_detail_search(r_search){
		
		var frm_delivery_list = document.frm_delivery_list;
		t_beginYear   = frm_delivery_list.beginYear;
		t_beginMonth  = frm_delivery_list.beginMonth;
		t_beginDay    = frm_delivery_list.beginDay;
		t_endYear     = frm_delivery_list.endYear;
		t_endMonth    = frm_delivery_list.endMonth;
		t_endDay      = frm_delivery_list.endDay;
		s_search_type = frm_delivery_list.s_search_type;
		t_search_word = frm_delivery_list.t_search_word;
		btn_search    = frm_delivery_list.btn_search;
		
		if (r_search.value == 'detail_search'){
			t_beginYear.disabled   = false;
			t_beginMonth.disabled  = false;
			t_beginDay.disabled    = false;
			t_endYear.disabled     = false;
			t_endMonth.disabled    = false;
			t_endDay.disabled      = false;
			s_search_type.disabled = false;
			t_search_word.disabled = false;
			btn_search.disabled    = false;
		}
		else {
			t_beginYear.disabled    = true;
			t_beginMonth.disabled	= true;
			t_beginDay.disabled     = true;
			t_endYear.disabled		= true;
			t_endMonth.disabled     = true;
			t_endDay.disabled	    = true;
			s_search_type.disabled  = true;
			t_search_word.disabled  = true;
			btn_search.disabled     = true;
		}
			
	}
	
	
	function fn_detail_order(orderId){
	    location.href = "${contextPath}/admin/order/orderDetail.do?orderId=" + orderId; 
	}
	
	function fn_detail_search(){
		
		var frm_delivery_list = document.frm_delivery_list;
		
		beginYear   = frm_delivery_list.beginYear.value;
		beginMonth  = frm_delivery_list.beginMonth.value;
		beginDay    = frm_delivery_list.beginDay.value;
		endYear     = frm_delivery_list.endYear.value;
		endMonth    = frm_delivery_list.endMonth.value;
		endDay      = frm_delivery_list.endDay.value;
		searchType = frm_delivery_list.s_search_type.value;
		searchWord = frm_delivery_list.t_search_word.value;
	
		if (beginYear < 10) 	beginYear = "0" + beginYear; 
		if (beginMonth < 10) 	beginMonth = "0" + beginMonth; 
		if (beginDay < 10) 		beginDay = "0" + beginDay; 
		if (endYear < 10) 		endYear = "0" + endYear; 
		if (endMonth < 10) 		endMonth = "0" + endMonth; 
		if (endDay < 10) 		endDay = "0" + endDay; 
		
		var url = "${contextPath}/admin/order/adminOrderMain.do?";
			url += "beginDate=" + beginYear + "-" + beginMonth + "-" + beginDay;
			url += "&endDate=" + endYear + "-" + endMonth + "-" + endDay;
			url += "&searchType=" + searchType;
			url += "&searchWord=" + searchWord;
		
		location.href = url;
		
	}
</script>
</head>
<body>
	<h3>주문 조회</h3>
	<form name="frm_delivery_list" action="${contextPath }/admin/admin.do" method="post">	
		<table>
			<tbody>
				<tr>
					<td>
						<input type="radio" name="r_search_option" value="simple_search" checked onClick="fn_enable_detail_search(this)"/> 간단조회 &nbsp;&nbsp;&nbsp;
						<input type="radio" name="r_search_option" value="detail_search"  onClick="fn_enable_detail_search(this)" /> 상세조회 &nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						오늘 일자 &nbsp;&nbsp;
						<select name="curYear" disabled>
						    <c:forEach   var="i" begin="0" end="5">
						      <c:choose>
						        <c:when test="${todayYear==todayYear-i}">
						          <option value="${todayYear}" selected>${todayYear}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${todayYear-i }">${todayYear-i }</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>
						</select>년 
						<select name="curMonth" disabled>
							 <c:forEach var="i" begin="1" end="12">
						      <c:choose>
						        <c:when test="${todayMonth==i}">
						          <option value="${i}"  selected>${i}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${i}">${i}</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>					
						</select>월
					 	<select name="curDay" disabled>
						  	<c:forEach   var="i" begin="1" end="31">
						      <c:choose>
						        <c:when test="${todayDay==i}">
						          <option value="${i}" selected>${i}</option>
						        </c:when>
						        <c:otherwise>
						          <option value="${i}">${i}</option>
						        </c:otherwise>
						      </c:choose>
						    </c:forEach>	
						</select>일 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<input type="button" value="당일"  onclick="search_order_list('today')">
						<input type="button" value="1주"   onclick="search_order_list('one_week')">
						<input type="button" value="2주"   onclick="search_order_list('two_week')">
						<input type="button" value="1개월" onclick="search_order_list('one_month')">
						<input type="button" value="2개월" onclick="search_order_list('two_month')">
						<input type="button" value="3개월" onclick="search_order_list('three_month')">
						<input type="button" value="4개월" onclick="search_order_list('four_month')">
					</td>
				</tr>
				<tr>
				  <td>
					조회 기간 &nbsp;&nbsp;
					<select name="beginYear" disabled>
					 <c:forEach var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${beginYear==todayYear-i }">
					          <option value="${todayYear-i }" selected>${todayYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${todayYear-i }">${todayYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="beginMonth" disabled >
						 <c:forEach var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${beginMonth==i }">
					          <option value="${i }" selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="beginDay" disabled >
					  <c:forEach   var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${beginDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일  &nbsp; ~ &nbsp;
					<select name="endYear" disabled >
					 <c:forEach var="i" begin="0" end="5">
					      <c:choose>
					        <c:when test="${endYear==todayYear-i }">
					          <option value="${todayYear-i }" selected>${todayYear-i  }</option>
					        </c:when>
					        <c:otherwise>
					          <option value="${todayYear-i }">${todayYear-i }</option>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>
					</select>년 
					<select name="endMonth" disabled >
						 <c:forEach var="i" begin="1" end="12">
					      <c:choose>
					        <c:when test="${endMonth==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i <10 }">
					              <option value="${i }">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i }">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>					
					</select>월
					 <select name="endDay" disabled >
					  <c:forEach var="i" begin="1" end="31">
					      <c:choose>
					        <c:when test="${endDay==i }">
					          <option value="${i }"  selected>${i }</option>
					        </c:when>
					        <c:otherwise>
					          <c:choose>
					            <c:when test="${i<10}">
					              <option value="${i}">0${i }</option>
					            </c:when>
					            <c:otherwise>
					            <option value="${i}">${i }</option>
					            </c:otherwise>
					          </c:choose>
					        </c:otherwise>
					      </c:choose>
					    </c:forEach>	
					</select>일
												 
				  </td>
				</tr>
				<tr>
				  <td>
				  	<select name="s_search_type" disabled>
						<option value="all" selected>전체</option>
						<option value="ordererName">주문자</option>
						<option value="goodsTitle">주문상품명</option>
					</select>
					<input type="text"  size="30"  id="t_search_word" disabled/>  
					<input type="button"  value="조회" id="btn_search" onclick="fn_detail_search()"  disabled />
				  </td>
				</tr>
			</tbody>
		</table>
		<div class="clear">
	</div>
	<div align="right">
		<input type="button" class="btn btn-Light btn-sm" value="Excel Export" onclick="location.href='${contextPath}/admin/order/orderExcelExport.do'" />
	</div>
	<div class="clear"></div>
	 <table class="list_view">
	  <tbody align=center >
	   <tr style="background:blue; color:#fff; height: 50px">
		<td class="fixed" >주문번호</td>
		<td class="fixed">주문시간</td>
		<td>주문내역</td>
		<td>배송상태</td>
		<td>배송수정</td>
	   </tr>
  	   <c:choose>
	    <c:when test="${empty newOrderList}">			
		 <tr>
	       <td colspan=5 class="fixed">
			  <strong>주문한 상품이 없습니다.</strong>
		   </td>
	     </tr>
		</c:when>
	 	<c:otherwise>
	     <c:forEach var="item" items="${newOrderList}" varStatus="status">
	          	<tr>
					<td width=10%><strong>${item.orderId}</strong></td>
					<td width=20%><strong><fmt:formatDate value="${item.payOrderTime}" pattern="yyyy-MM-dd HH:mm"/> </strong> </td>
					<td width=50% align="left" >
					 <a href="javascript:fn_detail_order('${item.orderId}')">
					     <strong>주문자 : ${item.ordererName}</strong><br>
					     <strong>주문자 연락처 : ${item.ordererHp}</strong><br><br>
					     <strong>수령자:${item.receiverName}</strong><br>
					     <strong>수령자 전화번호 : ${item.receiverHp1}-${item.receiverHp2}-${item.receiverHp3}</strong><br>
					     <strong>주문상품명(수량) : ${item.goodsTitle}(${item.orderGoodsQty})</strong><br>
				     </a> 
					</td>
					<td width=10%>
						<c:if test="${item.deliveryState == 'deliveryPrepared'}"> 
							<div class="badge badge-info badge-pill">배송준비중</div>
						</c:if>
						<c:if test="${item.deliveryState == 'delivering'}"> 
							<div class="badge badge-secondary badge-pill">배송중</div>
						</c:if>
						<c:if test="${item.deliveryState == 'finishedDelivering'}"> 
							<div class="badge badge-primary badge-pill">배송완료</div>
						</c:if>
						<c:if test="${item.deliveryState == 'cancelOrder'}"> 
							<div class="badge badge-danger badge-pill">주문취소</div>
						</c:if>
						<c:if test="${item.deliveryState == 'returningGoods'}"> 
							<div class="badge badge-yellow badge-pill">반품</div>
						</c:if>
					</td>
					<td width=10%>
						<select name="deliveryState" id="deliveryState${status.index}">
							<option value="deliveryPrepared" <c:if test="${item.deliveryState=='deliveryPrepared' }"> selected </c:if>>배송준비중</option>
							<option value="delivering" <c:if test="${item.deliveryState=='delivering' }"> selected </c:if>>배송중</option>
							<option value="finishedDelivering" <c:if test="${item.deliveryState=='finishedDelivering' }"> selected </c:if>>배송완료</option>
							<option value="cancelOrder" <c:if test="${item.deliveryState=='cancelOrder' }"> selected </c:if>>주문취소</option>
							<option value="returningGoods" <c:if test="${item.deliveryState=='returningGoods' }"> selected </c:if>>반품</option>
						</select>
						<input type="button" value="배송수정" class="btn btn-outline-blue btn-xs" onClick="fn_modify_order_state('${item.orderId}','deliveryState${status.index}')" />
					</td>				
					</tr>
				</c:forEach>
			  </c:otherwise>
	      </c:choose>
		  </tbody>
	     </table>
       </form>   	
</body>
</html>

