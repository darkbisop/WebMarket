<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>This is Admin Page</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css?after">
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="top_gnb_area">
            <ul class="list">
                <c:if test="${member != null}">
                    <c:if test="${member.adminCk == 1}">
                        <li><a href="${pageContext.request.contextPath}/admin/product/register"><spring:message code="message.admin.ProductRegister" /></a> </li>
                        <li><a href="${pageContext.request.contextPath}/admin/product/list"><spring:message code="message.admin.ProductList" /></a> </li>
                        <li>
                            <a id="gnb_logout_button">Logout</a>
                        </li>
                        <a href="${pageContext.request.contextPath}/admin/main?lang=ko" style="color:red;">한국어</a> /
                        <a href="${pageContext.request.contextPath}/admin/main?lang=ja" style="color:red;">日本語</a>
                    </c:if>
                </c:if>
            </ul>
        </div>

        <div class="top_area">
            <div class="logo_area">
                <h1>logo area</h1>
            </div>

            <div class="search_area">
                <h1>search area</h1>
            </div>

            <div class="login_area">
                <%@include file="../include/loginArea.jsp"%>
            </div>
            <div class="clearfix">
            </div>
        </div>

        <div class="navi_bar_area">
            <h1>navi bar</h1>
        </div>
        <div class="content_area">
            <h1>content area</h1>
        </div>
    </div>
</div>
<%@include file="../include/logOut.jsp"%>
