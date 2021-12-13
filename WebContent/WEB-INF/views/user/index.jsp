<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class="navbar-brand">登録ユーザー一覧</h1>
    </c:param>
    <c:param name="content">
        <c:if test="${flush != null }">
            <div id="flush_seccess">
            </div>
        </c:if>
        <table id="user_list" class="table mt-5">
            <tbody >
                <thead class="thead-dark">
                <tr>
                    <th>ユーザーID</th>
                    <th>ユーザー名</th>
                    <th>操作</th>
                </tr>
                </thead>
                <c:forEach var = "users" items="${users}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${users.user_id}" /></td>
                        <td><c:out value="${users.user_name}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${users.delete_flag == 1}">
                                    (削除済み)
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/user/show?id=${users.id}' />">詳細表示</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <nav aria-label="user list page nation">
            <div class="d-inline-flex bg-white text-primary border border-primary rounded mb-1 pl-1 pr-1">
                (全 ${users_count} 件)
            </div><br />
            <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Previous</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 15) + 1}" step="1">
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
        <p><a href="<c:url value='/user/new' />" class="btn btn-warning btn-sm">新規ユーザーの登録</a></p>
        <p><a href="<c:out value="../" />" class="btn btn-primary btn-sm">トップページへ戻る</a></p>
    </c:param>
</c:import>