<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error" class="pt-1 pl-1 pr-1 rounded">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>

<br />

<div class="d-flex bg-success text-white mt-2 p-3 w-100">
    <!-- <div class="form-group pt-1 pr-1"> -->
    <div class="container">
        <div class="row p-2 border-3">
            <div class="col-sm-6 d-inline-flex">
                <div class="size14 mr-2">
                    出題時期
                </div>
                <!-- datalistの値にカーソルを合わせるとイベントハンドラであるonmouseoverからjsのfunctionを呼び出し、
    ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
                <c:choose>
                    <c:when test="${amquestion.qs_year == null || edit_flag == null}">
                        <input type="text" name="year" autocomplete="on" list="years"
                            id="yearsIn" class="form-control form-control-sm w-50"
                            onmouseover="incopy('year',this.id)" />
                        <c:import url="yearlist.jsp" />
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="year" autocomplete="on" list="years"
                            id="yearsIn" class="form-control form-control-sm w-50"
                            onmouseover="incopy('year',this.id)"
                            value="${amquestion.qs_year}" placeholder="Readonly input here…"
                            readonly />
                        <c:import url="yearlist.jsp" />
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="col-sm-6">
                <!-- ラジオボタンをクリックすると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
                <c:choose>
                    <c:when test="${amquestion.qs_season == '春期' && edit_flag != null}">
                        <input type="radio" name="season" value="春期" checked="checked"
                            id="spring" onclick="incopy('season',this.id)"
                            disabled="disabled" />春期
        <input type="radio" name="season" value="秋期" id="autum"
                            onclick="incopy('season',this.id)" disabled="disabled" />秋期
    </c:when>
                    <c:when test="${amquestion.qs_season == '秋期' && edit_flag != null}">
                        <input type="radio" name="season" value="春期" id="spring"
                            onclick="incopy('season',this.id)" disabled="disabled" />春期
        <input type="radio" name="season" value="秋期" checked="checked"
                            id="autum" onclick="incopy('season',this.id)" disabled="disabled" />秋期
    </c:when>
                    <c:otherwise>
                        <input type="radio" name="season" value="春期" id="spring"
                            onclick="incopy('season',this.id)" />春期
        <input type="radio" name="season" value="秋期" id="autum"
                            onclick="incopy('season',this.id)" />秋期
    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <c:forEach var="i" begin="1" end="80" step="1">
        <div class="row mt-3 p-2 border-3">
            <div class="col-sm-3 d-inline-flex">
            <!-- 問題の番号を入力すると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->


            <div class="size14 mr-2">
                    <input type="hidden" name="qnum${i}" value="${i}" />
                    問${i}
            </div>
<%--             <c:choose> --%>
<%--                 <c:when test="${amquestion.qs_number == null || edit_flag == null}"> --%>
<!--                         <input type="number" name="qnumber" max=80 min=1 id="qnum" -->
<!--                             onclick="incopy('number',this.id)" -->
<!--                             class="form-control form-control-sm ml-2" /> -->
<%--                 </c:when> --%>
<%--                 <c:otherwise> --%>
<!--                         <input type="number" name="qnumber" max=80 min=1 id="qnum" -->
<!--                             onclick="incopy('number',this.id)" -->
<!--                             class="form-control form-control-sm ml-2" -->
<%--                             value="${amquestion.qs_number}" --%>
<!--                             placeholder="Readonly input here…" readonly /> -->
<%--                 </c:otherwise> --%>
<%--             </c:choose> --%>
            </div>

            <div class="col-sm-6 d-inline-flex">
            <div class="mr-2">
                問題カテゴリ
            </div>
            <c:choose>
                <c:when test="${amquestion.category == null}">

                    <input type="text" name="category${i}" autocomplete="on"
                        list="categoryies" class="form-control form-control-sm w-50" />
                    <c:import url="categorylist.jsp" />
                </c:when>
                <c:otherwise>
                    <input type="text" name="category${i}" autocomplete="on"
                        list="categoryies" value="${amquestion.category}"
                        class="form-control w-50" />
                    <c:import url="categorylist.jsp" />
                </c:otherwise>
            </c:choose>
        </div>

            <div class="col-sm-3 d-inline-flex">
            <div class="mr-2">
                解答
            </div>
            <c:choose>
                <c:when test="${amquestion.answer == 1}">
                <input type="radio" name="answer${i}" value="1" checked="checked">ア
                <input type="radio" name="answer${i}" value="2">イ
                <input type="radio" name="answer${i}" value="3">ウ
                <input type="radio" name="answer${i}" value="4">エ
            </c:when>
                <c:when test="${amquestion.answer == 2}">
                <input type="radio" name="answer${i}" value="1">ア
                <input type="radio" name="answer${i}" value="2" checked="checked">イ
                <input type="radio" name="answer${i}" value="3">ウ
                <input type="radio" name="answer${i}" value="4">エ
            </c:when>
                <c:when test="${amquestion.answer == 3}">
                    <input type="radio" name="answer${i}" value="1">ア
                <input type="radio" name="answer${i}" value="2">イ
                <input type="radio" name="answer${i}" value="3"
                        checked="checked">ウ
                <input type="radio" name="answer${i}" value="4">エ
            </c:when>
                <c:when test="${amquestion.answer == 4}">
                    <input type="radio" name="answer${i}" value="1">ア
                <input type="radio" name="answer${i}" value="2">イ
                <input type="radio" name="answer${i}" value="3">ウ
                <input type="radio" name="answer${i}" value="4"
                        checked="checked">エ
            </c:when>
                <c:otherwise>
                    <input type="radio" name="answer${i}" value="1">ア
                <input type="radio" name="answer${i}" value="2">イ
                <input type="radio" name="answer${i}" value="3">ウ
                <input type="radio" name="answer${i}" value="4">エ
            </c:otherwise>
            </c:choose>
            </div>

    </div>
    </c:forEach>
    </div>
    </div>
<input type="hidden" name="_token" value="${_token}" />
<button type="submit">問題を登録する</button>
<!-- </div> -->

<br />