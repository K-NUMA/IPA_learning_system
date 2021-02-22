<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <c:if test="${userinfo != null}">
            <h1 class="navbar-brand">
            <c:out value="${userinfo.user_id}" />さんのユーザー マイページ
            </h1>
        </c:if>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${userinfo != null}">
                <h2 class="d-inline-flex p-2 bd-highlight bg-primary text-white rounded mt-5">ユーザー情報</h2>
                <table class="table table-bordered">
                    <tbody class="table-info"">
                        <tr>
                            <th>ユーザーID</th>
                            <td><c:out value="${userinfo.user_id}" /></td>
                        </tr>
                        <tr>
                            <th>ユーザー名</th>
                            <td><c:out value="${userinfo.user_name}" /></td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${userinfo.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${userinfo.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <p><a href="<c:url value='/mypage/felog' /> ">基本情報技術者試験の自習履歴を見る</a></p>
        <p><a href="<c:url value='/' /> ">午前問題のトップページへ戻る</a></p>
    </c:param>
</c:import>