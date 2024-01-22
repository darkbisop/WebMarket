<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .input_Area { margin:10px 0; }
        select { width:80px; }
        label { display:inline-block; width:70px; padding:5px; }
        label[for='productDescription'] { display:block; }
        input { width:150px; }
        textarea#productDescription { width:400px; height:180px; }
        .select_img img {margin: 20px 0;}
    </style>
</head>
<body>
<div id="container">
    <h2><spring:message code="message.admin.ProductRegister" /></h2>
    <a href="${pageContext.request.contextPath}/admin/product/register?lang=ko" style="color:red;">한국어</a> /
    <a href="${pageContext.request.contextPath}/admin/product/register?lang=ja" style="color:red;">日本語</a>
    <form role="form" action="${pageContext.request.contextPath}/admin/product/register.do" method="post" autocomplete="off" enctype="multipart/form-data">
        <label>1<spring:message code="message.admin.category" /></label>
        <label>
            <select id="category1" name="">
                <option value=""><spring:message code="message.admin.category.All" /></option>
            </select>
        </label>

        <label>2<spring:message code="message.admin.category" /></label>
        <label>
            <select id="category2" name="categoryCode">
                <option value=""><spring:message code="message.admin.category.All" /></option>
            </select>
        </label>

        <div class="input_Area">
            <label for="productName">상품명</label>
            <input type="text" id="productName" name="productName" />
        </div>

        <div class="input_Area">
            <label for="productName_ja">商品名</label>
            <input type="text" id="productName_ja" name="productName_ja" />
        </div>

        <div class="input_Area">
            <label for="productPrice">상품 가격</label>
            <input type="text" id="productPrice" name="productPrice" />
        </div>

        <div class="input_Area">
            <label for="productPrice_ja">商品の値段</label>
            <input type="text" id="productPrice_ja" name="productPrice_ja" />
        </div>

        <div class="input_Area">
            <label for="productStock">상품 재고</label>
            <input type="text" id="productStock" name="productStock" />
        </div>

        <div class="input_Area">
            <label for="productDescription">상품 설명</label>
            <textarea rows="5" cols="50" id="productDescription" name="productDescription"></textarea>
        </div>

        <div class="input_Area">
            <label for="productDescription_ja">商品のご紹介</label>
            <textarea rows="5" cols="50" id="productDescription_ja" name="productDescription_ja"></textarea>
        </div>

        <div class="input_Area">
            <label for="sale"><spring:message code="message.admin.ProductSales" /></label>
            <input type="text" id="sale" name="sale" />
        </div>

        <div class="input_Area">
            <label for="productImage"><spring:message code="message.admin.ProductImg" /></label>
            <input type="file" id="productImage" name="file" />
            <div class="select_img"><img src="" alt=""></div>
            <%= request.getSession().getServletContext().getRealPath("/")%>
        </div>

        <div class="input_Area">
            <button type="submit" id="register_Btn" class="btn btn-primary"><spring:message code="message.admin.ProductRegistBtn" /></button>
        </div>
    </form>
</div>

<script>
    const jsonData = JSON.parse('${category}');
    let cate1Arr = [];
    let cate1Obj = {};

    for (let i = 0; i < jsonData.length; i ++) {
        if (jsonData[i].depth === 1) {
            cate1Obj = {};
            cate1Obj.categoryCode = jsonData[i].categoryCode;
            cate1Obj.categoryName = jsonData[i].categoryName;
            cate1Arr.push(cate1Obj);
        }
    }

    for (let i = 0; i < cate1Arr.length; i++) {
        $("#category1").append("<option value='" + cate1Arr[i].categoryCode + "'>" + cate1Arr[i].categoryName + "</option>");
    }

    $("#category1").on("change", function () {
        let cate2Arr = [];
        let cate2Obj = {};
        let cate2Select = $("#category2");

        for (let i = 0; i < jsonData.length; i ++) {
            if (jsonData[i].depth === 2) {
                cate2Obj = {};
                cate2Obj.categoryCode = jsonData[i].categoryCode;
                cate2Obj.categoryName = jsonData[i].categoryName;
                cate2Obj.categoryCodeRef = jsonData[i].categoryCodeRef;
                cate2Arr.push(cate2Obj);
            }
        }

        cate2Select.children().remove();

        $("#category1 option:selected").each(function () {
            const val = $(this).val();
            console.log(val);
            cate2Select.append("<option value='" + val + "'>ALL</option>")

            for (let i = 0; i < cate2Arr.length; i++) {
                if (val === cate2Arr[i].categoryCodeRef) {
                    cate2Select.append("<option value='" + cate2Arr[i].categoryCode + "'>" + cate2Arr[i].categoryName + "</option>");
                }
            }
        });
    });

    $("#productImage").change(function () {
        if (this.files && this.files[0]) {
            const reader = new FileReader();
            reader.onload = function (data) {
                $(".select_img img").attr("src", data.target.result).width(500);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    const regExp = /[^0-9]/gi;
    $("#productPrice").keyup(function () {numCheck($(this));});
    $("#productStock").keyup(function () {numCheck($(this));});

    function numCheck(selector) {
        const tempVal = selector.val();
        if (isNaN(tempVal)) {
            alert("숫자만 입력 가능합니다!");
            selector.val(tempVal.replace(regExp, ""));
        }
    }

</script>
</body>
</html>
