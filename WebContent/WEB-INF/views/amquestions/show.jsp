<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="pagename">
        <h1>試験問題の詳細画面</h1>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${amquestion != null}">
                <p>問題の出題時期</p>
                <div>
                <div><p><c:out value="${amquestion.qs_year}" />&nbsp;<c:out value="${amquestion.qs_season}" />&nbsp;</p></div>
                <div><p>問<c:out value="${amquestion.qs_number}" /></p></div>
                </div>

                <p>問題の内容</p>
                <div>
                    <img src="<c:url value='${qcontent}' />" alt="not view">
                </div>
                <p><a href="<c:url value='/amquestions/edit?id=${amquestion.id}' />">この問題を編集する</a></p>
            </c:when>
            <c:otherwise>
                <h2>ご指定の問題は見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/amquestions/index?select_year=${amquestion.qs_year}&select_season=${amquestion.qs_season}' /> ">一覧に戻る</a></p>
    </c:param>
</c:import>