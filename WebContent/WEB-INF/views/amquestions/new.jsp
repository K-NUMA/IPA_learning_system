<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class="navbar-brand">試験問題の登録画面</h1>
    </c:param>
    <c:param name="content">
        <h2 class="d-inline-flex text-white bg-primary pt-1 pl-1 pb-1 pr-1 rounded mt-5">
                下記の項目を入力してください
        </h2>
        <br />
        <div class="d-inline-flex bg-warning pt-1 pl-1 pb-1 pr-1">※問題の内容は事前に画像をアップロードしておいて下さい</div>

        <form method="POST" action="<c:url value='/amquestions/manager/create' />" id="qupload">
            <c:import url="_forms.jsp" />
        </form>

        <br />

        <br />
        <a href="<c:url value="/amquestions/manager/index" />" class="btn btn-primary btn-sm pl-1 pr-1">問題の管理画面へ(管理者用)</a>
    </c:param>
</c:import>