<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/app.jsp">
    <c:param name="pagename">
            <c:if test="${qlist[qnum] != null}">
              <h1 class=" navbar-brand"><c:out value="${qlist[qnum].qs_year}" />&nbsp;<c:out value="${qlist[qnum].qs_season}" />&nbsp;
              FE試験問題&nbsp;問<c:out value="${qlist[qnum].qs_number}" /></h1>
            </c:if>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${qlist[qnum] != null}">

                <div class="d-flex justify-content-start pt-5">
                <div class="d-flex flex-column bd-highlight mb-3 p-1 bg-dark text-white" >
                        <div class="pt-2 pl-2 mb-2 bg-primary text-white"><p>問題内容</p></div>
                    <img src="<c:url value='/FE_img/${qlist[qnum].contentImg}' />" alt="not view">
                </div>

                <div class="d-flex flex-column bd-highlight mb-3 p-1 bg-dark text-white border-left" >
                <div class="pt-2 pl-2 mb-2 bg-primary text-white"><p>解答を選ぶ</p></div>
                <div class="d-flex justify-content-end">
                <c:choose>
                    <c:when test="${answerd == null}">
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="1" name="ans">
                            <button type="submit" class="btn btn-outline-success">ア</button>
                        </form>
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="2" name="ans">
                            <button type="submit" class="btn btn-outline-success">イ</button>
                        </form>
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="3" name="ans">
                            <button type="submit" class="btn btn-outline-success">ウ</button>
                        </form>
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="4" name="ans">
                            <button type="submit" class="btn btn-outline-success">エ</button>
                        </form>
                    </c:when>
                </c:choose>
                </div>
                </div>

                <div class="d-flex flex-column bd-highlight mb-3 p-1 bg-dark text-white border-left" >
                <div class="pt-2 pl-2 mb-2 bg-primary text-white"><p>問題一覧</p></div>
                 <c:set var="scoringFlg" value="true" />


                    <div class="d-flex flex-row bd-highlight" >
                    <!-- 1列目 -->
                    <c:forEach var="i" begin="0" end="3" step="1">
                     <div class="d-flex flex-column bd-highlight" >
                    <c:forEach var="j" begin="0" end="19" step="1">

                          <div class="d-flex flex-row bd-highlight" >
                                <c:if test="${j+i+i*19 < qnumbers }">
                                    <a href="<c:url value='/amquestions/test/testquestion?select_year=${qlist[j+i + i*19].qs_year}
                                    &select_season=${qlist[j+i+i*19].qs_season}&qnumber=${qlist[j+i+i*19].qs_number}' />"
                                    class="border border-primary rounded-circle">問<c:out
                                    value="${qlist[j+i+i*19].qs_number}" /></a>:
                                <c:choose>
                                    <c:when test="${ans[j+i+i*19] == null}">
                                        <c:out value="　" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${ans[j+i+i*19]}" />&nbsp;
                                    </c:otherwise>
                                </c:choose>

                                <c:if test="${ans[j+i+i*19] == null}">
                                    <c:set var="scoringFlg" value="false" />
                                </c:if>

                                </c:if>
                          </div>



                        </c:forEach>
                        </div>
                    </c:forEach>
                </div>

                    <c:if test="${scoringFlg == 'true'}">
                        <form method="GET" action="<c:url value='/amquestions/test/testscoring' />">
                            <button type="submit" onClick="return confirmMessage('採点を行いますか？')">
                            解答結果を採点する</button>
                        </form>
                    </c:if>

                <!-- 誤ってクリックして戻らないように、トップページへ戻るかどうか確認する -->
                <p><a href="<c:url value='/' /> " onClick="return confirmMessage('解答中ですがトップページに戻りますか？')" >トップページへ戻る</a></p>

            </div>
            </div>
            </c:when>

            <c:otherwise>
                <h2>ご指定の問題は見つかりませんでした。</h2>
                <p>試験の年度と時期をもう一度選んでください</p>
                <p><a href="<c:url value='/' /> " class="btn btn-primary">トップページへ戻る</a></p>
            </c:otherwise>
        </c:choose>
        <br />


        <script>
        function confirmMessage(message){
            if(window.confirm(message)){
                return true;
            }else{
                return false;
            }
        }
        </script>
    </c:param>
</c:import>