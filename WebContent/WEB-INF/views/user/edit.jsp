<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
            <h1 class="navbar-brand">登録ユーザーの編集画面</h1>
    </c:param>
    <c:param name="content">
        <div class="mt-5 mx-auto">
        <form method="POST" action="<c:url value='/user/update' />">
            <c:import url="_user_form.jsp" />
        </form>

        <p><a href="<c:url value='/user/index'/>" class="btn btn-primary btn-sm">一覧に戻る</a></p>
        </div>
    </c:param>
</c:import>