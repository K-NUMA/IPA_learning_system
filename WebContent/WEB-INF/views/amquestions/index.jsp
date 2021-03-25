<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class="navbar-brand">基本情報技術者試験 問題の管理画面(管理者用ページ)</h1>
    </c:param>
    <c:param name="content">

        <c:if test="${error != null}">
            <div id="flush_error">
                <c:out value="${error}"></c:out>
            </div>
        </c:if>

        <h2 class="d-inline-flex p-2 bd-highlight bg-primary text-white rounded mt-5" >問題一覧</h2>

        <c:choose>
            <c:when test="${test_year==null || test_season==null || test_year == ''}">
                <p>試験の年度と時期を選んでください</p>
            </c:when>
            <c:otherwise>
                <p>
                    <c:out value="${test_year}" />&nbsp;
                    <c:out value="${test_season}" />
                    試験
                </p>
                <c:forEach var="amquestion" items="${amquestions}" varStatus="status">
                    <a href="<c:url value='/amquestions/manager/show?id=${amquestion.id}' />" class="btn btn-primary btn-sm">問<c:out
                            value="${amquestion.qs_number}" />
                    </a>&nbsp;
                    <c:if test="${status.count % 10 == 0}">
                        <br /><br />
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <br /><br />

        <div class="d-flex text-white bg-success pl-1 pr-5 w-25">試験を表示</div>
        <div class="d-flex text-black bg-white border-5 border-success w-25 mb-1 pb-2 pl-2 pr-2">
        <form method="GET" action="<c:url value='/amquestions/manager/index' />">
            <div class="form-group pt-1">
            <label for="qyear">出題時期</label><br />
            <input type="text" name="select_year" autocomplete="on" list="years" class="mb-n1">
            <c:import url="yearlist.jsp" />
            </div>
            <input type="radio" name="select_season" value="春期" checked="checked">春期
            <input type="radio" name="select_season" value="秋期" id="autum">秋期
            <br />
            <button type="submit" >表示する</button>
        </form>
        </div>
            <div class="d-inline-flex bg-white text-primary border border-primary rounded mb-1 pl-1 pr-1">
                問題登録数 <c:out value="${questions_count}" />件
            </div>
        <br /><br />

            <!-- 画像で保存した問題内容をサーブレットでアップロード heroku環境でアップロードが上手くいかないため断念
            <div class="d-inline-flex text-white bg-success pl-1 pr-5 w-30">問題の画像をアップロード</div>
             <div class="d-flex text-black bg-white border-5 border-success w-30 pl-2 pr-2">

                <form method="POST" enctype="multipart/form-data" action="<c:url value='/qupload' />" >
                    <div class="form-group pt-1 pr-1 mb-n2">
                        <input type="file" name="file"/><br /><br />
                    </div>
                    <div class="pb-1">
                        <button type="submit" >アップロード</button>
                    </div>
                </form>
             </div>
             <br /> -->

        <p><a href="<c:url value="/amquestions/manager/new" />" class="btn btn-primary btn-sm">午前の問題を新規登録</a> </p>
        <p><a href="<c:url value='/' /> " class="btn btn-primary btn-sm">トップページへ戻る</a></p>
    </c:param>
</c:import>