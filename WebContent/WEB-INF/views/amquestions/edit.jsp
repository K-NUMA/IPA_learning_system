<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">基本情報技術者試験 問題の編集画面</h1>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${amquestion != null}">
                <form method="POST" action="<c:url value='/amquestions/update' />">
                    <c:import url="_forms.jsp" />
                </form>

                <p>問題の内容</p>
                <label for="filename">変更前ファイル名:<c:out value="${amquestion.contentImg}" /></label><br />
                <c:if test="${upload_error != null}">
                    <p>
                        <c:out value="${upload_error}" />
                    </p>
                </c:if>
            </c:when>
             <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/amquestions/show?id=${amquestion.id}' /> ">問題の詳細に戻る</a></p>
        <a href="<c:url value="/amquestions/index" />">問題の管理画面へ(管理者用)</a>
        <br />
    </c:param>
</c:import>