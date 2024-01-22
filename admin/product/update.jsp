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
    </style>
</head>
<body>
<div id="container">
    <h2>Product Update</h2>
    <form role="form" action="${pageContext.request.contextPath}/admin/product/update.do" method="post" autocomplete="off" enctype="multipart/form-data">
        <input type="hidden" name="productNum" value="${product.productNum}" />
        <br>
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
            <input type="text" id="productName" name="productName" value="${product.productName}"/>
        </div>

        <div class="input_Area">
            <label for="productName_ja">商品名</label>
            <input type="text" id="productName_ja" name="productName_ja" value="${product.productName_ja}"/>
        </div>

        <div class="input_Area">
            <label for="productPrice">상품 가격</label>
            <input type="text" id="productPrice" name="productPrice" value="${product.productPrice}"/>
        </div>

        <div class="input_Area">
            <label for="productPrice_ja">商品の値段</label>
            <input type="text" id="productPrice_ja" name="productPrice_ja" value="${product.productPrice_ja}"/>
        </div>

        <div class="input_Area">
            <label for="productStock"><spring:message code="message.admin.ProductStocks" /></label>
            <input type="text" id="productStock" name="productStock" value="${product.productStock}"/>
        </div>

        <div class="input_Area">
            <label for="productDescription">상품 설명</label>
            <textarea rows="5" cols="50" id="productDescription" name="productDescription">${product.productDescription}</textarea>
        </div>

        <div class="input_Area">
            <label for="productDescription_ja">商品のご紹介</label>
            <textarea rows="5" cols="50" id="productDescription_ja" name="productDescription_ja">${product.productDescription_ja}</textarea>
        </div>

        <div class="input_Area">
            <label for="sale"><spring:message code="message.admin.ProductSales" /></label>
            <input type="text" id="sale" name="sale" value="${product.sale}"/>
        </div>

        <div class="input_Area">
            <label for="productImage"><spring:message code="message.admin.ProductImg" /></label>
            <input type="file" id="productImage" name="file" />
            <div class="select_img">
                <img src="/ProjectWebMarket/resources${product.productImage}" alt="">
                <input type="hidden" name="productImage" value="${product.productImage}" />
                <input type="hidden" name="productThumbnail" value="${product.productThumbnail}" />
            </div>
            <%= request.getSession().getServletContext().getRealPath("/")%>
        </div>

        <div class="input_Area">
            <button type="submit" id="update_Btn" class="btn btn-primary"><spring:message code="message.admin.ProductUpdateBtn" /></button>
            <button type="button" id="cancel_Btn" class="btn btn-primary"><spring:message code="message.admin.ProductCancelBtn" /></button>
        </div>
    </form>
</div>

<script>
    const jsonData = JSON.parse('${category}');
    const select_cateCode  = '${product.categoryCode}';
    const select_cateCodeRef = '${product.categoryCodeRef}';
    const select_cateName = '${product.categoryName}';

    let cate1Arr = [];
    let cate1Obj = {};
    let cate2Arr = [];
    let cate2Obj = {};
    let cate2Select = $("#category2");

    $(document).ready(function () {
        for (let i = 0; i < jsonData.length; i ++) {
            if (jsonData[i].depth === 1) {
                cate1Obj = {};
                cate1Obj.categoryCode = jsonData[i].categoryCode;
                cate1Obj.categoryName = jsonData[i].categoryName;
                cate1Arr.push(cate1Obj);
            }
        }

        for (let i = 0; i < jsonData.length; i ++) {
            if (jsonData[i].depth === 2) {
                cate2Obj = {};
                cate2Obj.categoryCode = jsonData[i].categoryCode;
                cate2Obj.categoryName = jsonData[i].categoryName;
                cate2Obj.categoryCodeRef = jsonData[i].categoryCodeRef;
                cate2Arr.push(cate2Obj);
            }
        }

        for (let i = 0; i < cate1Arr.length; i++) {
            $("#category1").append("<option value='" + cate1Arr[i].categoryCode + "'>" + cate1Arr[i].categoryName + "</option>");
        }

        for (let i = 0; i < cate2Arr.length; i++) {
            if (select_cateCodeRef === cate2Arr[i].categoryCodeRef) {
                $("#category2").append("<option value='" + cate2Arr[i].categoryCode + "'>" + cate2Arr[i].categoryName + "</option>");
            }
        }

        if(select_cateCodeRef != null && select_cateCodeRef !== '') {
            $("#category1").val(select_cateCodeRef);
            $("#category2").val(select_cateCode);
        }
    });

    $("#category1").on("change", function () {
        cate2Select.children().remove();

        $("#category1 option:selected").each(function () {
            const val = $(this).val();
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
                $(".select_img img").attr("src", data.target.result).width(300);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    $("#cancel_Btn").click(function () {
       location.href = "${pageContext.request.contextPath}/admin/product/view?n=" + ${product.productNum};
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
