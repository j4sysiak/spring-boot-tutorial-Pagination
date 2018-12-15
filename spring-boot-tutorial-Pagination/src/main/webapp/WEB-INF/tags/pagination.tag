<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%@ attribute name="page" required="true" type="org.springframework.data.domain.Page" %>
<%@ attribute name="url" required="true" %>

<%-- Number of page numbers to display at once. --%>
<%@ attribute name="size" required="false"%>
<c:set var="size" value="${empty size ? 10: size}" />
<p>Size: ${size}</p>

<c:set var="block" value="${empty param.b ? 0 : param.b}" />
<p>Block: ${block}</p>

<c:set var="startPage" value="${block * size + 1}" />
<c:set var="endPage"   value="${(block + 1) * size}" />
<c:set var="endPage"   value="${endPage > page.totalPages ? page.totalPages : endPage}" />

 <p>startPage: ${startPage}</p>
 <p>endPage: ${endPage}</p>
 
<div class="pagination">

	<a href="${url}?b=${block-1}">&lt;&lt;</a> 

	<c:forEach var="pageNumber" begin="${startPage}" end="${endPage}">

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
 





























