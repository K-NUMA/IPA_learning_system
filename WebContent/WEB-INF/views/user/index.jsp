<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class="navbar-brand">登録ユーザー一覧</h1>
    </c:param>
    <c:param name="content">
        <c:if test="${flush != null }">
            <div id="flush_seccess">
                <c:out value="${flush}"/>
            </div>
        </c:if>
        <table id="user_list" class="mt-5">
            <tbody >
                <tr>
                    <th>ユーザーID</th>
                    <th>ユーザー名</th>
                    <th>操作</th>
                </tr>
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

        <div id="pagenation">
            (全 ${users_count} 件) <br />
            <c:forEach var="i" begin="1" end="${((users_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/user/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/user/new' />">新規ユーザーの登録</a></p>
        <p><a href="<c:out value="../" />" >トップページへ戻る</a></p>
    </c:param>
</c:import>