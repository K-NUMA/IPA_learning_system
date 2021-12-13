<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <c:if test="${test_score != null}">
            <h1 class=" navbar-brand">
                <c:out value="${test_score.test_year}" />
                &nbsp;
                <c:out value="${test_score.test_season}" />
                &nbsp; FE試験問題&nbsp;結果の詳細
            </h1>
        </c:if>
    </c:param>
    <c:param name="content">

        <c:choose>
            <c:when test="${test_score != null}">
                    <div class="d-inline-flex bg-white border border-primary rounded text-primary justify-content-start p-2 mt-5 mb-3">
                    <h2>試験の点数:<c:out value="${test_score.score}" />点</h2>
                    </div>
                    <br />
                    <div class="d-inline-flex bg-white border border-primary rounded text-primary p-2 mb-3">出題数:
                    <c:out value="${test_score.anscount}" />問</div>
                    <br />
            <c:choose>
                <c:when test="${qcategorys != null}">
                <div class="d-inline-flex text-white bg-primary pt-1 pl-1 pb-1 pr-1 rounded mt-3 mb-1">問題の分野毎の正答率</div>

                <table id="score_rate">
                    <tbody>
                        <c:forEach var="categorys" items="${qcategorys}" varStatus="status">
                            <c:choose>
                                <c:when test="${question_flag[status.index] == true}">
                                    <tr class="border">
                                    <th class="text-white bg-primary pl-2 pr-2">
                                    <c:out value="${category_name[status.index]}" />
                                    </th>
                                    <td class="bg-white p-1"><c:out value="${categorys * 100}" />%</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr class="border">
                                    <th class="text-white bg-primary pl-2 pr-2">
                                    <c:out value="${category_name[status.index]}" />
                                    </th>
                                    <td class="bg-white p-1">出題されていません</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                     </tbody>
                </table>

                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <canvas id="myPieChart1" class="d-flex bg-white mt-3 mb-3"></canvas>
                                </div>
                                <div class="col">
                                    <canvas id="myPieChart2" class="d-flex bg-white mt-3 mb-3"></canvas>
                                </div>
                                <div class="col">
                                    <canvas id="myPieChart3" class="d-flex bg-white mt-3 mb-3"></canvas>
                                </div>
                            </div>
                        </div>
                        <a href="<c:url value='/mypage/felog' /> " class="btn btn-primary" >前のページへ戻る</a>
                </c:when>
                <c:otherwise>
                    <h2>ご指定の内容は見つかりませんでした。</h2>
                    <a href="<c:url value='/' /> " class="btn btn-primary" >トップページへ戻る</a>
                </c:otherwise>
             </c:choose>
            </c:when>
            <c:otherwise>
                <h2>ご指定のページは見つかりませんでした。</h2>
                <a href="<c:url value='/' /> " class="btn btn-primary" >トップページへ戻る</a>
            </c:otherwise>
        </c:choose>

        <script>
        var ctx = document.getElementById("myPieChart1");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
            labels: ["正解", "不正解"],
            datasets: [{
                backgroundColor: [
                    "#00ff00",
                    "#ff0000",
                ],
                data: ["<c:out value="${qcategorys[0]*100}" />", "<c:out value="${100-qcategorys[0]*100}"/>"]
            }]
          },
          options: {
            title: {
              display: true,
              text: '"<c:out value="${category_name[0]}" />"'
            }
          }
        });

        var ctx = document.getElementById("myPieChart2");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
            labels: ["正解", "不正解"],
            datasets: [{
                backgroundColor: [
                    "#00ff00",
                    "#ff0000",
                ],
                data: ["<c:out value="${qcategorys[1]*100}" />", "<c:out value="${100-qcategorys[1]*100}"/>"]
            }]
          },
          options: {
            title: {
              display: true,
              text: '"<c:out value="${category_name[1]}" />"'
            }
          }
        });

        var ctx = document.getElementById("myPieChart3");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
            labels: ["正解", "不正解"],
            datasets: [{
                backgroundColor: [
                    "#00ff00",
                    "#ff0000",
                ],
                data: ["<c:out value="${qcategorys[2]*100}" />", "<c:out value="${100-qcategorys[2]*100}"/>"]
            }]
          },
          options: {
            title: {
              display: true,
              text: '"<c:out value="${category_name[2]}" />"'
            }
          }
        });
        </script>
    </c:param>
</c:import>
