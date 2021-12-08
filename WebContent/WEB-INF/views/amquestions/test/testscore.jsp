<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/app.jsp">
    <c:param name="pagename">
            <c:if test="${qlist != null}">
              <h1 class=" navbar-brand"><c:out value="${qlist[0].qs_year}" />&nbsp;<c:out value="${qlist[0].qs_season}" />&nbsp;
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
            <br />

        <div class="d-inline-flex text-white bg-primary pt-1 pl-1 pb-1 pr-1 rounded mt-3 mb-1">問題の分野毎の正答率</div>

<!--                 <table id="score_rate"> -->
<!--                     <tbody> -->
<%--                         <c:forEach var="categorys" items="${qcategorys}" varStatus="status"> --%>
<%--                             <c:choose> --%>
<%--                                 <c:when test="${anscategory[status.index] >= 0.0}"> --%>
<!--                                     <tr class="border"> -->
<!--                                     <th class="text-white bg-primary pl-2 pr-2"> -->
<%--                                     <c:out value="${categorys}" /> --%>
<!--                                     </th> -->
<%--                                     <td class="bg-white p-1"><c:out value="${anscategory[status.index]}" />%</td> --%>
<!--                                     </tr> -->
<%--                                 </c:when> --%>
<%--                                 <c:otherwise> --%>
<!--                                     <tr class="border"> -->
<!--                                     <th class="text-white bg-primary pl-2 pr-2"> -->
<%--                                     <c:out value="${categorys}" /> --%>
<!--                                     </th> -->
<!--                                     <td class="bg-white p-1">出題されていません</td> -->
<!--                                     </tr> -->
<%--                                 </c:otherwise> --%>
<%--                             </c:choose> --%>
<%--                         </c:forEach> --%>
<!--                      </tbody> -->
<!--                 </table> -->

        <canvas id="myRaderChart" class="d-flex bg-white mt-3 mb-3"></canvas>
        <h2 class="d-inline-flex bg-white border border-primary rounded text-primary p-2 mb-3">出題数:<c:out value="${qcounts}" />問</h2>
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
            <form method="POST" action="<c:url value="../../amquestions/scoreregist/registscore" />">
                <input type="hidden" name="scorepoint" value="${scorepoint}">
                <input type="hidden" name="qcounts" value="${qcounts}">
                <input type="hidden" name="qs_year" value="${qlist[0].qs_year}">
                <input type="hidden" name="qs_season" value="${qlist[0].qs_season}">
                <input type="hidden" name="_token" value="${_token}">
                <button type="submit" onClick="return confirmResistration('解答結果を送信しますか？')"
                class="btn btn-primary">
                解答結果を送信する
                </button>
            </form>
            &nbsp;
           <a href="<c:url value="/" />" onClick="return confirmResistration('解答結果を送信せずに戻りますか？')"
           class="btn btn-warning">
          トップページへ戻る
         </a>
        </div>
        </c:when>
        <c:otherwise>
            <h2>ご指定のページは見つかりませんでした。</h2>
            <p><a href="<c:out value="/" />" class="btn btn-primary" >トップページへ戻る</a></p>
        </c:otherwise>
        </c:choose>

        <script>
        var ctx = document.getElementById("myRaderChart");
        var myRadarChart = new Chart(ctx,
                {
        type: 'radar',
        data: {
            labels: [ "<c:out value="${qcategorys[0]}" />", "<c:out value="${qcategorys[1]}" />", "<c:out value="${qcategorys[2]}" />",
                "<c:out value="${qcategorys[3]}" />","<c:out value="${qcategorys[4]}" />","<c:out value="${qcategorys[5]}" />",
                "<c:out value="${qcategorys[6]}" />","<c:out value="${qcategorys[7]}" />","<c:out value="${qcategorys[8]}" />"],
            datasets: [{
                label: "<c:out value="${sessionScope.login_user.user_name}" />"+'さん',
                data: [ "<c:out value="${graphAnsCategory[0]*100}" />", "<c:out value="${graphAnsCategory[1]*100}" />", "<c:out value="${graphAnsCategory[2]*100}" />",
                    "<c:out value="${graphAnsCategory[3]*100}" />", "<c:out value="${graphAnsCategory[4]*100}" />","<c:out value="${graphAnsCategory[5]*100}" />",
                    "<c:out value="${graphAnsCategory[6]*100}" />","<c:out value="${graphAnsCategory[7]*100}" />","<c:out value="${graphAnsCategory[8]*100}" />"],
                backgroundColor: 'RGBA(225,95,150, 0.5)',
                borderColor: 'RGBA(225,95,150, 1)',
                borderWidth: 1,
                pointBackgroundColor: 'RGB(46,106,177)'
            }]
        },
        options: {
            title: {
                display: true,
                text: '問題分野毎の正答率(グラフ表示)'
            },
            scale:{
                ticks:{
                    suggestedMin: 0,
                    suggestedMax: 100,
                    stepSize: 10,
                    callback: function(value, index, values){
                        return  value +  '%'
                    }
                }
            }
        }
    });
    </script>
    </c:param>
</c:import>