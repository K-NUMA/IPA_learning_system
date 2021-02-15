<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">基本情報技術者試験 午前問題 トップページ</h1>
    </c:param>
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2 class="mt-5">出題形式一覧</h2>

        <label for="askquestion">一問一答形式</label>
        <p><a href="<c:url value="/amquestions/test/askquestions?requestpage=top" />">問題を解く</a></p>

        <label for="askquestion">試験形式(ログイン必須です)</label>
        <form method="GET" action="<c:url value="/amquestions/test/testquestion" />">
            <label for="qyear">出題時期</label>
            <input type="text" name="select_year" autocomplete="on" list="years">
            <c:import url="../amquestions/yearlist.jsp" />

            <input type="radio" name="select_season" value="春期" checked="checked">春期
            <input type="radio" name="select_season" value="秋期" id="autum">秋期
            <input type="hidden" name="qnumber" value="0">
            <br />
            <label for="qyear">出題数を指定</label>
            <select id="numbers" name="select_number">
                <option value="20">20問
                <option value="40">40問
                <option value="60">60問
                <option value="80">80問
            </select>
            <br />
            <button type="submit">試験問題を解く</button>
            <br />

        </form>
        <br />

            <c:if test="${sessionScope.login_user == null}">
                <p><a href="<c:url value='/login' /> " class="btn btn-primary">ログインする</a></p>
            </c:if>
        <br />

        <c:if test="${sessionScope.login_user != null && login_user.admin_flag == 1}">
            <a href="<c:url value="/amquestions/index" />">問題の管理画面へ(管理者用)</a><br />
            <a href="<c:url value="/user/index" />">登録ユーザーの管理画面へ(管理者用)</a>
        </c:if>
    </c:param>
</c:import>