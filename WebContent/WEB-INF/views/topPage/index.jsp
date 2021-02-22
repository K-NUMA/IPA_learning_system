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
        <p><h2 class="d-inline-flex p-2 bd-highlight bg-primary text-white rounded mt-5">出題形式一覧</h2><p>

        <div class="d-flex text-white rounded bg-success pl-1 pr-1 mb-1 w-25">一問一答形式</div>
        <form method="GET" action="<c:url value="/amquestions/test/askquestions?requestpage=top" />">
            <button type="submit">問題を解く</button>
        </form>
        <br />

        <div class="d-flex text-white rounded bg-success pl-1 pr-5 mb-1 w-25">試験形式(ログイン必須です)</div>
        <div class="border-5 border-success w-25 my-box pb-2 pl-2 pr-2">
        <form method="GET" action="<c:url value="/amquestions/test/testquestion" />">
            <div class="form-group pt-1">
                    <label for="qyear">出題時期</label>
                    <input type="text" name="select_year" autocomplete="on" list="years" class="form-control">
            <c:import url="../amquestions/yearlist.jsp" />
            </div>

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
        </div>
        <br />

            <c:if test="${sessionScope.login_user == null}">
                <p>アカウントをお持ちでない方は</p>
                <p><a href="<c:url value='/user/new' /> " class="btn btn-primary">ユーザーの新規登録</a></p>
            </c:if>
        <br />

        <c:if test="${sessionScope.login_user != null && login_user.admin_flag == 1}">
            <a class="d-inline-flex text-white rounded bg-warning pl-1 pr-1 mb-1" href="<c:url value="/amquestions/manager/index" />">問題の管理画面へ(管理者用)</a><br />
            <a class="d-inline-flex text-white rounded bg-warning pl-1 pr-1 mb-1" href="<c:url value="/user/index" />">登録ユーザーの管理画面へ(管理者用)</a>
        </c:if>
    </c:param>
</c:import>