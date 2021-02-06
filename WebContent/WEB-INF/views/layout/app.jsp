<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>IPA 学習支援システム</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                    <h1>IPA 学習支援システム</h1>
                    <div id="pagename">
                        ${param.pagename}
                    </div>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <a href="<c:url value="/amquestions/index" />">問題の管理画面へ(管理者用)</a>
            <div id="footer">
                by Keita Koinuma.
            </div>
        </div>
    </body>
</html>