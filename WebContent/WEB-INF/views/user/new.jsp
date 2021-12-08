<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
            <h1 class="navbar-brand">新規ユーザーの登録</h1>
    </c:param>
    <c:param name="content">
        <c:if test="${errors != null}">
            <div id="flush_error">
                入力内容にエラーがあります。<br />
                <c:forEach var="error" items="${errors}">
                    ・<c:out value="${error}" /><br />
                </c:forEach>
            </div>
        </c:if>

        <div  class="d-flex flex-column position-absolute toplittle" style="left:31.25%;  width:37.5%;">
        <form method="POST" action="<c:url value='/user/create' />">
            <c:import url="_user_form.jsp" />
        </form>
        </div>

    </c:param>
</c:import>