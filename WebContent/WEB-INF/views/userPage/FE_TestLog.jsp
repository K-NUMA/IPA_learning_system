<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
    <c:if test="${userinfo != null}">
            <h1 class="navbar-brand">
            <c:out value="${userinfo.user_id}" />さんのFEの自習履歴
            </h1>
    </c:if>
    </c:param>

    <c:param name="content">
    <c:choose>
    <c:when test="${test_count != 0}">
        <h2 class="d-inline-flex p-2 bd-highlight bg-primary text-white rounded mt-5">【自習履歴】</h2>
        <table class="table">
            <tbody>
            <thead class="thead-dark">
                <tr>
                    <th class="test_year">試験の出題年&nbsp;</th>
                    <th class="test_season">試験の出題時期&nbsp;</th>
                    <th class="test_season">点数&nbsp;</th>
                    <th class="test_date">受けた日付&nbsp;</th>
                </tr>
             </thead>
                <c:forEach var="testlog" items="${testlog}" varStatus="status">
                    <tr class="table-primary">
                        <td class="test_year"><c:out value="${testlog.test_year}" /></td>
                        <td class="test_season"><c:out value="${testlog.test_season}" /></td>
                        <td class="test_season"><c:out value="${testlog.score}" /></td>
                        <td class="report_date"><fmt:formatDate value="${testlog.anstime}" pattern='yyyy-MM-dd' /></td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagenation">
            (全 ${test_count} 件) <br />
            <c:forEach var="i" begin="1" end="${((test_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='//mypage/felog?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
      </c:when>
      <c:otherwise>
        <h1 class="mt-5">自習データがありませんでした</h1>
      </c:otherwise>
    </c:choose>
        <p><a href="<c:url value='/mypage/top' />">マイページのトップへ戻る</a></p>
    </c:param>
</c:import>