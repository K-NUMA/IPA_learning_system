<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>基本情報技術者試験 問題一覧(管理者用ページ)</h2>
        問題登録数 <c:out value="${question_count}" />件
        <p><a href="<c:url value="/amquestions/new" />">午前の問題を新規登録</a> </p>
    </c:param>
</c:import>