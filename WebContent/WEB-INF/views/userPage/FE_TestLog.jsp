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
                    <th class="test_result">結果の詳細&nbsp;</th>
                </tr>
             </thead>
                <c:forEach var="testlog" items="${testlog}" varStatus="status">
                    <tr class="table-primary">
                        <td class="test_year"><c:out value="${testlog.test_year}" /></td>
                        <td class="test_season"><c:out value="${testlog.test_season}" /></td>
                        <td class="test_season"><c:out value="${testlog.score}" /></td>
                        <td class="report_date"><fmt:formatDate value="${testlog.anstime}" pattern='yyyy-MM-dd' /></td>
                        <td class="test_result"><a href="<c:url value='/mypage/feshow?id=${testlog.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <nav aria-label="test result list page nation">
            <div class="d-inline-flex bg-white text-primary border border-primary rounded mb-1 pl-1 pr-1">
                (全 ${test_count} 件)
            </div><br />
            <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${((test_count - 1) / 15) + 1}" step="1">
                        <li class="page-item"> <a class="page-link" href="<c:url value='/user/index?page=${i}' />">
                    <c:out value="${i}" /></a></li>
            </c:forEach>
            <li class="page-item">
                 <a class="page-link" href="#" aria-label="Next">
                 <span aria-hidden="true">&raquo;</span>
                 <span class="sr-only">Next</span>
                 </a>
            </li>
            </ul>
        </nav>
      </c:when>
      <c:otherwise>
        <h1 class="mt-5">自習データがありませんでした</h1>
      </c:otherwise>
    </c:choose>
        <p><a href="<c:url value='/mypage/top' />" class="btn btn-primary btn-sm">マイページのトップへ戻る</a></p>
    </c:param>
</c:import>