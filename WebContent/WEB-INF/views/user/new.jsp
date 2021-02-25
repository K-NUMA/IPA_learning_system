<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
            <h1 class="navbar-brand">新規ユーザーの登録画面</h1>
    </c:param>
    <c:param name="content">
        <h2 class="d-inline-flex text-white bg-primary pt-1 pl-1 pb-1 pr-1 rounded mt-5">
                下記の項目を入力してください
        </h2>
        <div>
        <form method="POST" action="<c:url value='/user/create' />">
            <c:import url="_user_form.jsp" />
        </form>
        </div>

        <p><a href="<c:url value='/user/index'/>" class="btn btn-primary pl-1 pr-1">一覧に戻る</a></p>
    </c:param>
</c:import>