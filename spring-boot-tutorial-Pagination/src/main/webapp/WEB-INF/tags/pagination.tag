<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="page" required="true" type="org.springframework.data.domain.Page" %>
<%@ attribute name="url" required="true" %>

<c:set var="block" value="${empty param.b ? 0 : param.b}" />

<p>Block: ${block}</p>

<div class="pagination">

	<a href="${url}?b=${block-1}">&lt;&lt;</a> 

	<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

		<c:choose>

			<c:when test="${page.number != pageNumber - 1}">
				<a href="${url}?p=${pageNumber}"><c:out value="${pageNumber}" /></a>
			</c:when>

			<c:otherwise>
				<strong><c:out value="${pageNumber}" /></strong>
			</c:otherwise>

		</c:choose>



		<c:if test="${pageNumber != page.totalPages}">
				 |
				</c:if>
	</c:forEach>
	
	<a href="${url}?b=${block+1}">&gt;&gt;</a> 
	
</div>
 





























