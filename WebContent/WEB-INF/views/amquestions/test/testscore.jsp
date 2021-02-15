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
            <c:choose>
                <c:when test="${passjudge == 1 }">
                    <div class="d-inline-flex bg-white border border-success rounded text-success justify-content-start p-2 mt-3 mb-3">
                    <h2><c:out value="${scorepoint}" />点&nbsp;<c:out value="合格です!!" /></h2>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="d-inline-flex bg-white border border-danger rounded text-danger justify-content-start p-2 mt-3 mb-3">
                    <h2><c:out value="${scorepoint}" />点&nbsp;<c:out value="不合格です" /></h2>
                    </div>
                </c:otherwise>
            </c:choose>
        <table class="table table-sm table-bordered p-1">
            <tbody class="text-white">
                <thead>
                <tr class="bg-primary">
                    <th>問題番号</th>
                    <th>選択した解答</th>
                    <th>問題の解答</th>
                    <th>解答結果</th>
                </tr>
                </thead>
                <c:forEach var="amquestion" items="${qlist}" varStatus="status">
                    <c:choose>
                        <c:when test="${ansresult[status.index] == '〇' }">
                            <tr class="bg-success">
                              <td>
                                  問<c:out value="${amquestion.qs_number}" />
                            </td>
                            <td>
                                  <c:out value="${ans[status.index]}" />
                            </td>

                            <!-- 問題の解答をア～エの記号で表示 -->
                            <c:choose>
                                <c:when test="${qlist[status.index].answer == '1'}">
                                    <td><c:out value="ア" /></td>
                                </c:when>
                                <c:when test="${qlist[status.index].answer == '2'}">
                                    <td><c:out value="イ" /></td>
                                </c:when>
                                <c:when test="${qlist[status.index].answer == '3'}">
                                    <td><c:out value="ウ" /></td>
                                </c:when>
                                <c:otherwise>
                                    <td><c:out value="エ" /></td>
                                </c:otherwise>
                            </c:choose>

                            <td>
                                  <c:out value="${ansresult[status.index]}" />
                            </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <tr class="bg-danger">
                              <td>
                                  問<c:out value="${amquestion.qs_number}" />
                            </td>
                            <td>
                                  <c:out value="${ans[status.index]}" />
                            </td>

                            <!-- 問題の解答をア～エの記号で表示 -->
                            <c:choose>
                                <c:when test="${qlist[status.index].answer == '1'}">
                                    <td><c:out value="ア" /></td>
                                </c:when>
                                <c:when test="${qlist[status.index].answer == '2'}">
                                    <td><c:out value="イ" /></td>
                                </c:when>
                                <c:when test="${qlist[status.index].answer == '3'}">
                                    <td><c:out value="ウ" /></td>
                                </c:when>
                                <c:otherwise>
                                    <td><c:out value="エ" /></td>
                                </c:otherwise>
                            </c:choose>

                            <td>
                                  <c:out value="${ansresult[status.index]}" />
                            </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </tbody>
        </table>

        <div class="d-flex flex-row pt-2 mb-2">
           <a href="<c:url value="/amquestions/test/registscore" />" onClick="return confirmResistration('解答結果を送信しますか？')"
            class="btn btn-primary">
            解答結果を送信する
            </a>
            &nbsp;
           <a href="<c:url value="/" />" onClick="return confirmResistration('解答結果を送信せずに戻りますか？')"
           class="btn btn-warning">
          トップページへ戻る
         </a>
        </div>
        </c:when>
        <c:otherwise>
            <h2>ご指定のページは見つかりませんでした。</h2>
            <p><a href="<c:out value="/" />" >トップページへ戻る</a></p>
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