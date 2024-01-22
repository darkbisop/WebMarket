<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>

    <style>
        #container_box table td { width:170px; text-align: center; padding: 10px; }
        #container_box table th { text-align: center; padding: 10px; border-bottom: 2px solid #666; }
        #container_box table tr:hover { background: #eee; }
        #container_box table img {width: 150px; height: 100px;}
    </style>
</head>
<body>
    <div id="container_box">
        <table>
            <thead>
                <tr>
                    <th><spring:message code="message.admin.Num" /></th>
                    <th><spring:message code="message.admin.ProductImg" /></th>
                    <th><spring:message code="message.admin.ProductName" /></th>
                    <th><spring:message code="message.admin.category.1" /></th>
                    <th><spring:message code="message.admin.ProductPrice" /></th>
                    <th><spring:message code="message.admin.ProductStocks" /></th>
                    <th><spring:message code="message.admin.ProductRegistDate" /></th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${list}" var="list">
                    <tr>
                        <td>${list.productNum}</td>
                        <td><a href="${pageContext.request.contextPath}/admin/product/view?n=${list.productNum}"><img src="/ProjectWebMarket/resources${list.productImage}" alt=""></a></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/product/view?n=${list.productNum}">${list.productName}</a>
                        </td>
                        <td>${list.categoryName}</td>
                        <td>
                            <fmt:formatNumber value="${list.productPrice}" pattern="###,###,###" />
                        </td>
                        <td>${list.productStock}</td>
                        <td>
                            <fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
