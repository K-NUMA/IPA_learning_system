<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">基本情報技術者試験 問題の編集画面</h1>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${amquestion != null}">
                <h2 class="d-inline-flex text-white bg-primary pt-1 pl-1 pb-1 pr-1 rounded mt-5">
                下記の該当する項目を編集してください
                </h2>
                <br />

                <div class="d-inline-flex bg-warning pt-1 pl-1 pb-1 pr-1">※問題の出題時期、番号は変更できません。
                </div>
                <br />

                <form method="POST" action="<c:url value='/amquestions/manager/update' />">
                    <c:import url="_forms.jsp" />
                </form>

                <h2 class="d-flex text-white bg-success mb-n1 pl-1 pr-1 w-25">問題の詳細</h2>
                <div class="d-flex text-black bg-white border-5 border-success w-25 my-box mt-n1 pb-2 pl-2 pr-2">
                <label for="filename">変更前ファイル名:<br />
                <c:out value="${amquestion.contentImg}" /></label><br />
                <c:if test="${upload_error != null}">
                    <p>
                        <c:out value="${upload_error}" />
                    </p>
                </c:if>
                </div>
                <br />
            </c:when>
             <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/amquestions/manager/show?id=${amquestion.id}' /> " class="btn btn-primary btn-sm pl-1 pr-1">問題の詳細に戻る</a></p>
        <a href="<c:url value="/amquestions/manager/index" />" class="btn btn-primary btn-sm pl-1 pr-1">問題の管理画面へ(管理者用)</a>
        <br />
    </c:param>
</c:import>