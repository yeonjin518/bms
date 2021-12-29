<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
 <title>검색 도서 목록 페이지</title>
</head>
<body>
	<hgroup>
		<h1>${goodsStatus }</h1>
	</hgroup>
		<div class="main_book" >
		  <c:choose>
		  	<c:when test="${empty goodsList }">
		  	  <p>제품이 없습니다.</p>
		  	</c:when>
		  	<c:otherwise>
			  <c:forEach var="goods" items="${goodsList}" >
					<div class="book">
						<a href="${contextPath}/goods/goodsDetail.do?goodsId=${goods.goodsId}">
							<img width="121" height="154" src="${contextPath}/thumbnails.do?goodsId=${goods.goodsId}&fileName=${goods.goodsFileName}" alt="상품명">
						</a>
						<div class="sort">
						</div>
						<div class="title">
							<a href="${contextPath}/goods/goodsDetail.do?goodsId=${goods.goodsId}"> ${goods.goodsTitle}</a>
						</div>
						<div class="writer">${goods.goodsWriter} | ${goods.goodsPublisher}</div>
						<div class="price">
							<span style="text-decoration:line-through"><fmt:formatNumber value="${goods.goodsPrice}" type="number" /></span> <br>
							<fmt:formatNumber value="${goods.goodsSalesPrice}" type="number"  />
							<fmt:parseNumber var="goodsSalesPrice" value="${goods.goodsSalesPrice}" type="number"  />
							<fmt:parseNumber var="goodsPrice" value="${goods.goodsPrice}" type="number"  />							
				            (<fmt:formatNumber value="${100 - (goodsSalesPrice / goodsPrice * 100)}" pattern="##0" />%할인)
						</div>
					</div>
				</c:forEach> 
		  	</c:otherwise>
		  </c:choose>
		</div>
</body>