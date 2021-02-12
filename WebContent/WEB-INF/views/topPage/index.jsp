<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">基本情報技術者試験 午前問題 トップページ</h1>
    </c:param>
    <c:param name="content">
        <h2 class="mt-5">出題形式一覧</h2>
        <p><a href="<c:url value="/amquestions/test/askquestions?requestpage=top" />">一問一答形式で問題を解く</a></p>
        <form method="GET" action="<c:url value="/amquestions/test/testquestion" />">
            <label for="qyear">出題時期</label>
            <input type="text" name="select_year" autocomplete="on" list="years">
            <c:import url="../amquestions/yearlist.jsp" />

            <input type="radio" name="select_season" value="春期" checked="checked">春期
            <input type="radio" name="select_season" value="秋期" id="autum">秋期
            <input type="hidden" name="qnumber" value="0">
            <br />
            <button type="submit">指定の出題時期の試験問題を解く</button>
            <br />

        </form>
        <br />
        <a href="<c:url value="/amquestions/index" />">問題の管理画面へ(管理者用)</a>
    </c:param>
</c:import>