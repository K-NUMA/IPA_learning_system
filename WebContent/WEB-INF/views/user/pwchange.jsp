<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
            <h1 class="navbar-brand">パスワード変更画面</h1>
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

        <div class="d-flex flex-column mt-5 mx-auto">
        <form method="POST" action="<c:url value='/psupdate' />">
            <c:import url="_pwchange_form.jsp" />
        </form>

        <a href="<c:url value='/'/>" class="btn btn-primary btn-sm w-25 mx-auto">トップページへ戻る</a>
        </div>
    </c:param>
</c:import>