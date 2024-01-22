<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header.jsp"%>
<%--
    <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" id="sourcecode">
        $(function()
        {
            $('.scroll-pane').jScrollPane();
        });
    </script>--%>
</head>
<body>
<!--header-->
<div class="header-top">
    <div class="header-bottom">
        <div class="logo">
            <h1><a href="${pageContext.request.contextPath}/index">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="../include/aside.jsp"%>
        </div>
        <!---->
        <div class="lang-box">
            <a id="getURL" href="">한국어</a> /
            <a id="getURL_2" href="">日本語</a>
            <script>
                const url = window.location.href;
                const testUrl = url;
                const subUrl = url.substr(0, 64);

                document.getElementById("getURL").innerHTML = "<a href='" + subUrl + "&lang=ko" + "' style='color: red'>한국어</a>";
                document.getElementById("getURL_2").innerHTML = "<a href='" + subUrl + "&lang=ja" + "' style='color: red'>日本語</a>";
            </script>
        </div>
        <div class="cart box_1">
            <%@include file="../include/loginArea.jsp"%>
            <p></p>
            <%@include file="../include/logOut.jsp"%>
            <div class="clearfix"> </div>
        <!---->
        </div>
        <div class="clearfix"> </div>
        <!---->
    </div>
    <div class="clearfix"> </div>
</div>
<!--header//-->
<div class="product-model">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
            <li class="active">Products</li>
        </ol>
        <h2>Our Products</h2>
        <div class="col-md-9 product-model-sec">
            <c:forEach items="${list}" var="list">
                <div class="product-grid">
                    <div class="more-product"><span> </span></div>
                    <div class="product-img b-link-stripe b-animate-go  thickbox">
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <a href="${pageContext.request.contextPath}/shop/view?n=${list.productNum}"><img src="/ProjectWebMarket/resources${list.productThumbnail}" alt="" width="200px" height="200px"></a>
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <a href="${pageContext.request.contextPath}/shop/view?n=${list.productNum}">
                                        <button><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>Quick View</button>
                                    </a>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                            <h5 align="center">
                                <b class="langProduct">${list.productName}</b>
                                <script>
                                    $(".langProduct").each(function () {
                                        if (window.location.href.indexOf("lang=ko") > -1) {
                                            $(".langProduct").replaceWith("<b>${list.productName}</b>");
                                        } else if (window.location.href.indexOf("lang=ja") > -1) {
                                            $(".langProduct").replaceWith("<b>${list.productName_ja}</b>");
                                        }
                                    });
                                </script>
                            </h5>
                            <p></p>
                            <h5 class="item_price" align="center">
                                <b class="productPrice">
                                    <fmt:formatNumber value="${list.productPrice - list.productPrice * (list.sale * 0.01)}" pattern="###,###,###" />円
                                </b>
                                <script>
                                    if (window.location.href.indexOf("lang=ko") > -1) {
                                        $(".productPrice").replaceWith("<fmt:formatNumber value="${list.productPrice - list.productPrice * (list.sale * 0.01)}" pattern="###,###,###" />원");
                                    } else  if (window.location.href.indexOf("lang=ja") > -1) {
                                        $(".productPrice").replaceWith("<fmt:formatNumber value="${list.productPrice_ja - list.productPrice_ja * (list.sale * 0.01)}" pattern="###,###,###" />円");
                                    }
                                </script>
                            </h5>
                            <br>
                            <h5 align="center">
                                <del class="salePrice">${list.productPrice}円</del>
                                [${list.sale}% Off]
                                <script>
                                    if (window.location.href.indexOf("lang=ko") > -1) {
                                        $(".salePrice").replaceWith("<del>${list.productPrice}원</del>");
                                    } else  if (window.location.href.indexOf("lang=ja") > -1) {
                                        $(".salePrice").replaceWith("<del>${list.productPrice_ja}円</del>");
                                    }
                                </script>
                            </h5>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="rsidebar span_1_of_left">
            <section  class="sky-form">
                <div class="product_right">
                    <h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>Categories</h4>
                    <div class="tab1">
                        <ul class="place">
                            <li class="sort">Cake</li>
                            <li class="by"><%--<img src="images/do.png" alt="">--%></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="${pageContext.request.contextPath}/shop/list?c=101&l=2"><p>Chocolate Cake</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=102&l=2"><p>Strawberry Cake</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=103&l=2"><p>Honey Cake</p></a>
                        </div>
                    </div>
                    <div class="tab2">
                        <ul class="place">
                            <li class="sort">Muffin</li>
                            <li class="by"><%--<img src="images/do.png" alt="">--%></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="${pageContext.request.contextPath}/shop/list?c=201&l=2"><p>Chocolate Muffin</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=202&l=2"><p>Strawberry Muffin</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=203&l=2"><p>Honey Muffin</p></a>
                        </div>
                    </div>
                    <div class="tab3">
                        <ul class="place">
                            <li class="sort">Bread</li>
                            <li class="by"><%--<img src="images/do.png" alt="">--%></li>
                            <div class="clearfix"> </div>
                        </ul>
                        <div class="single-bottom">
                            <a href="${pageContext.request.contextPath}/shop/list?c=301&l=2"><p>Chocolate Bread</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=302&l=2"><p>Strawberry Bread</p></a>
                            <a href="${pageContext.request.contextPath}/shop/list?c=303&l=2"><p>Honey Bread</p></a>
                        </div>
                    </div>
                    <!--script-->
                    <script>
                        $(document).ready(function(){
                            $(".tab1 .single-bottom").hide();
                            $(".tab2 .single-bottom").hide();
                            $(".tab3 .single-bottom").hide();

                            $(".tab1 ul").click(function(){
                                $(".tab1 .single-bottom").slideToggle(300);
                                $(".tab2 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                            })
                            $(".tab2 ul").click(function(){
                                $(".tab2 .single-bottom").slideToggle(300);
                                $(".tab1 .single-bottom").hide();
                                $(".tab3 .single-bottom").hide();
                            })
                            $(".tab3 ul").click(function(){
                                $(".tab3 .single-bottom").slideToggle(300);
                                $(".tab1 .single-bottom").hide();
                                $(".tab2 .single-bottom").hide();
                            })
                        });
                    </script>
                </div>
            </section>
        </div>
    </div>
</div>
<!---->
<div class="subscribe">
    <div class="container">
        <h3>Newsletter</h3>
        <form>
            <input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
            <input type="submit" value="Subscribe">
        </form>
    </div>
</div>
<!---->
<div class="footer">
    <%@ include file="../include/footer.jsp"%>
</div>
<!---->
<div class="copywrite">
    <%@ include file="../include/copywrite.jsp"%>
</div>
<!---->
</body>
</html>