<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/app.jsp">
    <c:param name="pagename">
            <c:if test="${qlist[qnum] != null}">
              <h1 class=" navbar-brand"><c:out value="${qlist[qnum].qs_year}" />&nbsp;<c:out value="${qlist[qnum].qs_season}" />&nbsp;
              FE試験問題&nbsp;解答結果</h1>
            </c:if>
    </c:param>
    <c:param name="content">
        <c:choose>
        <c:when test="${qlist != null}">
        <h2><c:out value="${scorepoint}" />点&nbsp;<c:out value="${passjudge}" /></h2>
        <table>
            <tbody>
                <tr>
                    <th>問題番号</th>
                    <th>解答結果</th>
                </tr>
                <c:forEach var="amquestion" items="${qlist}" varStatus="status">
                    <tr>
                        <td>
                            問<c:out value="${amquestion.qs_number}" />
                        </td>
                        <td>
                            <c:out value="${ansresult[status.index]}" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <p><a href="<c:url value="/amquestions/test/registscore" />" onClick="return confirmResistration('解答結果を送信しますか？')">
        解答結果を送信する
        </a></p>
        <p><a href="<c:url value="/" />" onClick="return confirmResistration('解答結果を送信せずに戻りますか？')">
        トップページへ戻る
        </a></p>
        </c:when>
        <c:otherwise>
            <h2>ご指定のページは見つかりませんでした。</h2>
            <p><a href="<c:out value="/" />" ">トップページへ戻る</a></p>
        </c:otherwise>
        </c:choose>
        <script>
        function confirmResistration(message){
            if(window.confirm(message)){
                return true;
            }else{
                return false;
            }
        }
        </script>
    </c:param>
</c:import>