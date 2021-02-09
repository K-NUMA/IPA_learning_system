<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../../layout/app.jsp">
    <c:param name="pagename">
        <c:if test="${qselected != null}">
            <h1 class=" navbar-brand"><c:out value="${qselected.qs_year}" />&nbsp;
            <c:out value="${qselected.qs_season}" />&nbsp;FE試験問題&nbsp;問<c:out value="${qselected.qs_number}" /></h1>
        </c:if>
    </c:param>
    <c:param name="content">
        <c:choose>
            <c:when test="${qselected != null}">

                <p>問題の内容</p>
                <div>
                    <img src="<c:url value='${qcontent}' />" alt="not view">
                </div>

                <c:choose>
                    <c:when test="${answerd == null}">
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="1" name="ans">
                            <button type="submit">ア</button>
                        </form>
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="2" name="ans">
                            <button type="submit">イ</button>
                        </form>
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="3" name="ans">
                            <button type="submit">ウ</button>
                        </form>
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="4" name="ans">
                            <button type="submit">エ</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${answerd == 1}">
                                <p><c:out value="${selectans}" /> 正解です！</p>
                            </c:when>
                            <c:otherwise>
                                <p><c:out value="${selectans}" /> 不正解です！ 正解は<c:out value="${trueans}" />です。</p>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>

                 <br /><br />

                    <form method="GET" action="<c:url value="/amquestions/test/askquestions" />">
                        <input type="hidden" name="requestpage" value="top">
                        <button type="submit">次の問題へ</button>
                    </form>

            </c:when>
            <c:otherwise>
                <h2>ご指定の問題は見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/' /> ">トップページへ戻る</a></p>
    </c:param>
</c:import>