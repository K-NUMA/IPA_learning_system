<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br />
<div>
<label for="qyear">出題時期</label><br />
<input type="text" name="year" autocomplete="on" list="years">
<datalist id="years">
<option value="平成30年">
<option value="平成31年">
<option value="令和元年">
<option value="令和2年">
</datalist>

<p>
<input type="radio" name="season" value="spring" checked="checked">春期
<input type="radio" name="season" value="autum" >秋期
</p>

<p>
問<input type="number" name="qnumber" max=80 min=1>
</p>

<p>
<p>解答<br />
<input type="radio" name="answer" value="1" checked="checked">ア
<input type="radio" name="answer" value="2" >イ
<input type="radio" name="answer" value="3" >ウ
<input type="radio" name="answer" value="4" >エ
</p>

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>
</div>

<br />