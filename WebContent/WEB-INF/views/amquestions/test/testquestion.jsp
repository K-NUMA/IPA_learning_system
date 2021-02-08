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

                <div>
                    <img src="<c:url value='/FE_img/${qlist[qnum].contentImg}' />" alt="not view">
                </div>

                <c:choose>
                    <c:when test="${answerd == null}">
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="1" name="ans">
                            <button type="submit">ア</button>
                        </form>
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="2" name="ans">
                            <button type="submit">イ</button>
                        </form>
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="3" name="ans">
                            <button type="submit">ウ</button>
                        </form>
                        <form method="GET" action="<c:url value='/amquestions/test/selectans' />">
                            <input type="hidden" value="<c:out value="${qlist[qnum].qs_number}" />" name="qnumber" />
                            <input type="hidden" value="4" name="ans">
                            <button type="submit">エ</button>
                        </form>
                    </c:when>
                </c:choose>

                <p>問題一覧</p>
                 <c:forEach var="amquestion" items="${qlist}" varStatus="status">
                    <a href="<c:url value='/amquestions/test/testquestion?select_year=${amquestion.qs_year}
                    &select_season=${amquestion.qs_season}&qnumber=${amquestion.qs_number}' />">問<c:out
                            value="${amquestion.qs_number}" />
                    </a>&nbsp;
                    <c:out value="${ans[status.index]}" />&nbsp;
                    <c:if test="${status.count % 20 == 0}">
                        <br />
                    </c:if>
                </c:forEach>

            </c:when>
            <c:otherwise>
                <h2>ご指定の問題は見つかりませんでした。</h2>
                <p>試験の年度と時期をもう一度選んでください</p>
            </c:otherwise>
        </c:choose>
        <br />

        <p><a href="<c:url value='/' /> ">トップページへ戻る</a></p>
    </c:param>
</c:import>