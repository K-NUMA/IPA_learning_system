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

                <div class="d-flex justify-content-start pt-5">
                    <div class="d-flex flex-column bd-highlight mb-3 p-1 bg-dark text-white" >
                        <div class="pt-2 pl-2 mb-2 bg-primary text-white"><p>問題内容</p></div>
                        <img src="<c:url value='${qcontent}' />" alt="not view">
                    </div>

                 <div class="d-flex flex-column bd-highlight mb-3 p-1 bg-dark text-white border-left" >

                  <div class="pt-2 pl-2 mb-2 bg-primary text-white"><p>解答を選ぶ</p></div>
                <div class="d-flex justify-content-end">

                <c:choose>

                    <c:when test="${answerd == null}">
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="1" name="ans">
                            <button type="submit" class="btn btn-outline-success">ア</button>
                        </form>
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="2" name="ans">
                            <button type="submit" class="btn btn-outline-success">イ</button>
                        </form>
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="3" name="ans">
                            <button type="submit" class="btn btn-outline-success">ウ</button>
                        </form>
                        <form method="POST" action="<c:url value='/amquestions/test/ansquestions' />">
                            <input type="hidden" value="<c:out value="${qselected.id}" />" name="id" />
                            <input type="hidden" value="4" name="ans">
                            <button type="submit" class="btn btn-outline-success">エ</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <c:choose>

                            <c:when test="${answerd == 1}">
                                <div class="d-flex justify-content-end text-success">
                                <p><c:out value="${selectans}" /> 正解です！</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="d-flex justify-content-end text-danger">
                                <p><c:out value="${selectans}" /> 不正解です！ 正解は<c:out value="${trueans}" />です。</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>

                 <br /><br />
                    <form method="GET" action="<c:url value="/amquestions/test/askquestions" />">
                        <input type="hidden" name="requestpage" value="top">
                        <button type="submit" class="btn btn-primary">次の問題へ</button>
                    </form>
                </div>
                </div>
            </div>
            </c:when>

            <c:otherwise>
                <h2>ご指定の問題は見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value='/' /> " class="btn btn-primary">トップページへ戻る</a></p>
    </c:param>
</c:import>