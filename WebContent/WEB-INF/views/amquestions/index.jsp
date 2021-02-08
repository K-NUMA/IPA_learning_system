<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">基本情報技術者試験 問題の管理画面(管理者用ページ)</h1>
    </c:param>
    <c:param name="content">

        <h2 >問題一覧</h2>

        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

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
                    <a href="<c:url value='/amquestions/show?id=${amquestion.id}' />">問<c:out
                            value="${amquestion.qs_number}" />
                    </a>&nbsp;
                    <c:if test="${status.count % 10 == 0}">
                        <br />
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <br /><br />
        <form method="GET" action="<c:url value='/amquestions/index' />">
            <label for="qyear">出題時期</label><br />
            <input type="text" name="select_year" autocomplete="on" list="years">
            <c:import url="yearlist.jsp" />
            <br />
            <input type="radio" name="select_season" value="春期" checked="checked">春期
            <input type="radio" name="select_season" value="秋期" id="autum">秋期
            <button type="submit" >表示する</button>
        </form>
        問題登録数 <c:out value="${questions_count}" />件
        <br /><br />

            <!-- 画像で保存した問題内容をサーブレットでアップロード -->
             <label for="qcontentimage">問題の画像をアップロード</label>
             <form method="POST" enctype="multipart/form-data" action="<c:url value='/qupload' />" >
                <input type="file" name="file"/><br />
                <button type="submit" />アップロード</button><br />
             </form><br />

        <p><a href="<c:url value="/amquestions/new" />">午前の問題を新規登録</a> </p>
        <p><a href="<c:url value='/' /> ">トップページへ戻る</a></p>
    </c:param>
</c:import>