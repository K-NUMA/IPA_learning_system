<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja" class="h-100">
    <head>
        <meta charset="UTF-8">
        <title>IPA 学習支援システム</title>
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">
        <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </head>
    <body class="d-flex flex-column h-100 bodyback" >
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                    <h1 class="navbar-brand">IPA 学習支援システム</h1>
            &nbsp;
              FE試験問題&nbsp;解答結果</h1>
        <h2>点&nbsp;合格です!!</h2>
        <h2>点&nbsp;"不合格です"</h2>
        <table>
            <tbody>
                <tr>
                    <th>問題番号</th>
                    <th>解答結果</th>
                </tr>
                    <tr>
                        <td>
                            問1
                        </td>
                        <td>
                            〇
                            ×
                        </td>
                    </tr>
            </tbody>
        </table>

        <p><a href="<c:url value="/amquestions/test/registscore" />" onClick="return confirmResistration('解答結果を送信しますか？')">
        解答結果を送信する
        </a></p>
        <p><a href="<c:url value="/" />" onClick="return confirmResistration('解答結果を送信せずに戻りますか？')">
        トップページへ戻る
        </a></p>
        <script>
        function confirmResistration(message){
            if(window.confirm(message)){
                return true;
            }else{
                return false;
            }
        }
        </script>
        </nav>
        </header>
        </body>
        </html>