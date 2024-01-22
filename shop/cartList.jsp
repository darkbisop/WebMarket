<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header.jsp"%>

    <script>
        $(document).on("click", ".delete_btn", function(){
            const productName = $(this).parent().parent().find(".goodsName").val();
            console.log(productName);
            const data = {
                productName : productName
            };

            $.ajax({
                url : "${pageContext.request.contextPath}/shop/view/deleteCart?pN=" + productName,
                type : "post",
                data : data,
                success : function (result) {
                    if (result === 1) {
                        alert("해당 상품을 삭제하였습니다");
                        window.location.reload();
                    }
                },
                error : function () {
                    alert("삭제 하는데 실패하였습니다.")
                }
            });
        });

        function deleteAllProduct() {
            const productName = $(this).parent().parent().find(".goodsName").val();
            console.log(productName);
            const data = {
                productName : productName
            };

            if (confirm("상품을 모두 삭제하시겠습니까?")) {
                $.ajax({
                    url : "${pageContext.request.contextPath}/shop/view/deleteAllCart",
                    type : "post",
                    data : data,
                    success : function (result) {
                        if (result === 1) {
                            alert("모든 상품을 삭제하였습니다");
                            window.location.reload();
                        } else if (result === 2) {
                            alert("상품이 존재 하지 않습니다.");
                        }
                    },
                    error : function () {
                        alert("삭제 하는데 실패하였습니다.")
                    }
                });
            }
        }
    </script>
</head>
<body>
<!-- header -->
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
            <a href="${pageContext.request.contextPath}/shop/cartList?lang=ko" style="color:red;">한국어</a> /
            <a href="${pageContext.request.contextPath}/shop/cartList?lang=ja" style="color:red;">日本語</a>
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
<!-- check out -->
<div class="container">
    <div class="check-sec">
        <div class="col-md-3 cart-total">
            <a class="continue" href="${pageContext.request.contextPath}/shop/list?c=100&l=1">Continue to basket</a>
            <div class="price-details">
                <h3>Price Details</h3>
                <span>Total</span>
                <span class="total1">${total}</span>
                <span>Discount</span>
                <span class="total1">10%(Festival Offer)</span>
                <span>Delivery Charges</span>
                <span class="total1">${total}</span>
                <div class="clearfix"></div>
            </div>
            <ul class="total_price">
                <li class="last_price"> <h4>TOTAL</h4></li>
                <li class="last_price"><span>${total}</span></li>
            </ul>
            <div class="clearfix"></div>
            <div class="clearfix"></div>
            <a class="order" href="#">Place Order</a>
            <div class="total-item">
                <h3>OPTIONS</h3>
                <h4>COUPONS</h4>
                <a class="cpns" href="#">Apply Coupons</a>
            </div>
        </div>
        <div class="col-md-9 cart-items">
            <h1>My Shopping Bag</h1>
            <div class="cart-header">
                <c:forEach items="${cartList}" var="cartList">
                   <%-- <div class="close1 delete_btn"> </div>--%>
                    <div class="delete close">
                        <button type="button" class="delete_btn">X</button>
                    </div>
                    <div class="cart-sec simpleCart_shelfItem">
                        <div class="cart-item cyc">
                            <img src="/ProjectWebMarket/resources${cartList.productThumbnail}" alt="" width="120" height="140">
                        </div>
                        <div class="cart-item-info">
                            <span><h3>${cartList.productName}</h3></span>
                            <input type="hidden" class="goodsName" name="goodsName" value="${cartList.productName}">
                            <ul class="qty">
                                <li><p>Size : 5</p></li>
                                <li><p>Qty : ${cartList.cartStock}</p></li>
                            </ul>
                            <div class="delivery">
                                <p>Service Charges : <fmt:formatNumber pattern="###,###,###" value="${(cartList.productPrice - (cartList.productPrice * (cartList.sale * 0.01))) * cartList.cartStock}"/></p>
                                <span>Delivered in 2-3 bussiness days</span>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                    <%--<script>$(document).ready(function(c) {
                        $('.close1').on('click', function(c){
                            $('.cart-header').fadeOut('slow', function(c){
                                $('.cart-header').remove();
                            });
                        });
                    });
                    </script>--%>
                </c:forEach>
            </div>
            </div>
        </div>
    </div>
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