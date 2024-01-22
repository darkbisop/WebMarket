<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="<%--${pageContext.request.contextPath}/resources/lighting/--%>https://darkbisop.github.io/WebMarket/js/memenu.js"></script>
    <link href="<%--${pageContext.request.contextPath}/resources/lighting/--%>https://darkbisop.github.io/WebMarket/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<ul class="memenu skyblue"><li class="active"><a href="<%--${pageContext.request.contextPath}/--%>https://darkbisop.github.io/WebMarket/index">Home</a></li>
    <li class="grid"><a href="${pageContext.request.contextPath}/shop/list?c=100&l=1">Products</a>
        <div class="mepanel">
            <div class="row">
                <div class="col1 me-one">
                    <h4><a href="${pageContext.request.contextPath}/shop/list?c=100&l=1">Cake</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=101&l=2"><spring:message code="message.aside.category.1" /></a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=102&l=2"><spring:message code="message.aside.category.2" /></a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=103&l=2"><spring:message code="message.aside.category.3" /></a></li>
                    </ul>
                </div>
                <div class="col1 me-one">
                    <h4><a href="${pageContext.request.contextPath}/shop/list?c=200&l=1">Muffin</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=201&l=2"><spring:message code="message.aside.category.4" /></a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=202&l=2"><spring:message code="message.aside.category.5" /></a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=203&l=2"><spring:message code="message.aside.category.6" /></a></li>
                    </ul>
                </div>
                <div class="col1 me-one">
                    <h4><a href="${pageContext.request.contextPath}/shop/list?c=300&l=1">Bread</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=301&l=2"><spring:message code="message.aside.category.7" /></a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=302&l=2"><spring:message code="message.aside.category.8" /></a></li>
                        <li><a href="${pageContext.request.contextPath}/shop/list?c=303&l=2"><spring:message code="message.aside.category.9" /></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </li>
    <li class="grid"><a href="#">Typo</a></li>
    <li class="grid"><a href="#">Contact</a></li>
    <c:if test="${member != null and member.adminCk == 1}">
        <li class="grid active"><a href="${pageContext.request.contextPath}/admin/main">Admin Page</a></li>
    </c:if>
</ul>
</body>
</html>