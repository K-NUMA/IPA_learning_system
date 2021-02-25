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

<div class="d-flex bg-success text-white mt-2 pt-1 pl-2 pr-2 w-25">
<div class="form-group pt-1 pr-1">
<label for="qyear">出題時期</label><br />
<!-- datalistの値にカーソルを合わせるとイベントハンドラであるonmouseoverからjsのfunctionを呼び出し、
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
<c:choose>
    <c:when  test="${amquestion.qs_year == null}" >
        <input type="text" name="year" autocomplete="on" list="years" id="yearsIn"
        class="form-control" onmouseover="incopy('year',this.id)" />
        <c:import url="yearlist.jsp" />
    </c:when>
    <c:otherwise>
        <input type="text" name="year" autocomplete="on" list="years" id="yearsIn"
        class="form-control" onmouseover="incopy('year',this.id)" value="${amquestion.qs_year}" placeholder="Readonly input here…" readonly />
        <c:import url="yearlist.jsp" />
    </c:otherwise>
</c:choose>

<p>
<!-- ラジオボタンをクリックすると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
<c:choose>
    <c:when  test="${amquestion.qs_season == '春期'}" >
        <input type="radio" name="season" value="春期" checked="checked" id="spring" onclick="incopy('season',this.id)" disabled="disabled"/>春期
        <input type="radio" name="season" value="秋期" id="autum" onclick="incopy('season',this.id)" disabled="disabled"/>秋期
    </c:when>
    <c:when  test="${amquestion.qs_season == '秋期'}" >
        <input type="radio" name="season" value="春期" id="spring" onclick="incopy('season',this.id)" disabled="disabled"/>春期
        <input type="radio" name="season" value="秋期" checked="checked"  id="autum" onclick="incopy('season',this.id)" disabled="disabled"/>秋期
    </c:when>
    <c:otherwise>
        <input type="radio" name="season" value="春期" id="spring" onclick="incopy('season',this.id)" />春期
        <input type="radio" name="season" value="秋期" id="autum" onclick="incopy('season',this.id)" />秋期
    </c:otherwise>
</c:choose>
</p>

<p>
<!-- 問題の番号を入力すると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->

<c:choose>
    <c:when  test="${amquestion.qs_number == null}" >
        <div class="d-inline-flex">
        問<input type="number" name="qnumber" max=80 min=1 id="qnum" onclick="incopy('number',this.id)"
        class="form-control form-control-sm mt-n1" />
        </div>
    </c:when>
    <c:otherwise>
        <div class="d-inline-flex">
        問<input type="number" name="qnumber" max=80 min=1 id="qnum" onclick="incopy('number',this.id)"
        class="form-control form-control-sm" value="${amquestion.qs_number}" placeholder="Readonly input here…" readonly />
        </div>
    </c:otherwise>
</c:choose>
</p>

<p>

<div class="form-group">
<label for="qcategory">問題カテゴリ</label>
<c:choose>
    <c:when  test="${amquestion.category == null}" >

        <input type="text" name="category" autocomplete="on" list="categoryies" class="form-control form-control-sm" />
            <c:import url="categorylist.jsp" />
    </c:when>
    <c:otherwise>
        <input type="text" name="category" autocomplete="on" list="categoryies" value="${amquestion.category}"
        class="form-control form-control-sm" />
            <c:import url="categorylist.jsp" />
    </c:otherwise>
</c:choose>
</div>

<p><label for="answer">解答</label><br />
        <c:choose>
            <c:when test="${amquestion.answer == 1}">
                <input type="radio" name="answer" value="1" checked="checked">ア
                <input type="radio" name="answer" value="2">イ
                <input type="radio" name="answer" value="3">ウ
                <input type="radio" name="answer" value="4">エ
            </c:when>
            <c:when test="${amquestion.answer == 2}">
                <input type="radio" name="answer" value="1" >ア
                <input type="radio" name="answer" value="2" checked="checked">イ
                <input type="radio" name="answer" value="3">ウ
                <input type="radio" name="answer" value="4">エ
            </c:when>
            <c:when test="${amquestion.answer == 3}">
                <input type="radio" name="answer" value="1" >ア
                <input type="radio" name="answer" value="2" >イ
                <input type="radio" name="answer" value="3" checked="checked">ウ
                <input type="radio" name="answer" value="4">エ
            </c:when>
            <c:when test="${amquestion.answer == 4}">
                <input type="radio" name="answer" value="1" >ア
                <input type="radio" name="answer" value="2" >イ
                <input type="radio" name="answer" value="3" >ウ
                <input type="radio" name="answer" value="4" checked="checked">エ
            </c:when>
            <c:otherwise>
                <input type="radio" name="answer" value="1" >ア
                <input type="radio" name="answer" value="2" >イ
                <input type="radio" name="answer" value="3" >ウ
                <input type="radio" name="answer" value="4" >エ
            </c:otherwise>
        </c:choose>
    </p>

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>
</div>
</div>

<br />