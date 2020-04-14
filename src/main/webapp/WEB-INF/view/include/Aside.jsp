<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
   <li><a href="<c:url value='/infoChange'/>">
         회원정보수정 </a>
   <c:if test="${authInfo.sellerCheck == 'false' }">
      <li><a href="<c:url value='/changeSeller'/>">
            판매자전환 </a>
   </c:if>
   <li><a href="<c:url value='/deliveryAddress'/>">
         배송주소록 </a>
   <li><a href="<c:url value='/wishList'/>">
         관심상품 </a>
</ul>