<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>

<br />
<div>
<label for="qyear">出題時期</label><br />
<!-- datalistの値にカーソルを合わせるとイベントハンドラであるonmouseoverからjsのfunctionを呼び出し、
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
<c:choose>
    <c:when  test="${amquestion.qs_year == null}" >
        <input type="text" name="year" autocomplete="on" list="years" id="yearsIn" onmouseover="incopy('year',this.id)" />
        <c:import url="yearlist.jsp" />
    </c:when>
    <c:otherwise>
        <input type="text" name="year" autocomplete="on" list="years" id="yearsIn" onmouseover="incopy('year',this.id)" value="${amquestion.qs_year}" />
        <c:import url="yearlist.jsp" />
    </c:otherwise>
</c:choose>

<p>
<!-- ラジオボタンをクリックすると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
<c:choose>
    <c:when  test="${amquestion.qs_season == '春期'}" >
        <input type="radio" name="season" value="春期" checked="checked" id="spring" onclick="incopy('season',this.id)" />春期
        <input type="radio" name="season" value="秋期" id="autum" onclick="incopy('season',this.id)" />秋期
    </c:when>
    <c:when  test="${amquestion.qs_season == '秋期'}" >
        <input type="radio" name="season" value="春期" id="spring" onclick="incopy('season',this.id)" />春期
        <input type="radio" name="season" value="秋期" checked="checked"  id="autum" onclick="incopy('season',this.id)" />秋期
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
        問<input type="number" name="qnumber" max=80 min=1 id="qnum" onclick="incopy('number',this.id)" />
    </c:when>
    <c:otherwise>
        問<input type="number" name="qnumber" max=80 min=1 id="qnum" onclick="incopy('number',this.id)" value="${amquestion.qs_number}" />
    </c:otherwise>
</c:choose>
</p>

<p>

<label for="qcategory">問題カテゴリ</label><br />
<c:choose>
    <c:when  test="${amquestion.category == null}" >
        <input type="text" name="category" autocomplete="on" list="categoryies" />
            <c:import url="categorylist.jsp" />
    </c:when>
    <c:otherwise>
        <input type="text" name="category" autocomplete="on" list="categoryies" value="${amquestion.category}" />
            <c:import url="categorylist.jsp" />
    </c:otherwise>
</c:choose>

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

<br />