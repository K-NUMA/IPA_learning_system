<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">基本情報技術者試験 問題の詳細画面</h1>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${amquestion != null}">
                <div class="d-inline-flex text-white pl-1 pr-1 rounded bg-primary mt-5">問題の出題時期</div><br />
                <div>
                <div class="pl-2"><c:out value="${amquestion.qs_year}" />&nbsp;<c:out value="${amquestion.qs_season}" />&nbsp;</div>
                <br />
                <div class="d-inline-flex text-white pl-1 pr-1 rounded bg-primary">問題の番号</div><br />
                <div class="pl-2">問<c:out value="${amquestion.qs_number}" /></div>
                </div>
                <br />

                <table>
                     <thead class="d-flex text-white pl-1 pr-1 mb-n1 rounded bg-primary">
                        <tr>
                            <th >問題の内容</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                        <td>
                            <img src="<c:url value='${qcontent}' />" alt="not view" class="border-5 border-dark">
                        </td>
                        </tr>
                    </tbody>
                </table>
                <p><a class="btn btn-warning btn-sm pl-1 pr-1" href="<c:url value='/amquestions/manager/edit?id=${amquestion.id}' />">この問題を編集する</a></p>
            </c:when>
            <c:otherwise>
                <h2>ご指定の問題は見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a class="btn btn-primary btn-sm pl-1 pr-1" href="<c:url value='/amquestions/manager/index?select_year=${amquestion.qs_year}&select_season=${amquestion.qs_season}' /> ">問題の一覧に戻る</a></p>
    </c:param>
</c:import>