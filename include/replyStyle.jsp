<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <head>
    <style>
        section#content ul li { display:inline-block; margin:10px; }
        section#content div.productThumb img { width:200px; height:200px; }
        section#content div.productName { padding:10px 0; text-align:center; }
        section#content div.productName a { color:#000; }
        div.product div.productImage { float:left; width:350px; }
        div.product div.productImage img { width:350px; height:350px; padding-left: 20px; }

        div.product div.productInfo { float:left; width:330px; font-size:18px; padding-top: 20px; padding-left: 70px; }
        div.product div.productInfo p { margin:0 0 20px 0; }
        div.product div.productInfo p span { display:inline-block; width:100px; margin-right:15px; }

        div.product div.productInfo p.cartStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
        div.product div.productInfo p.cartStock button { font-size:26px; border:none; background:none; }
        div.product div.productInfo p.addToCart { text-align: left; }
        div.product div.productDescription { font-size:18px; clear:both; padding-top:30px; }

        section.replyForm { padding:30px 0; }
        section.replyForm div.input_area { margin:10px 0; }
        section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:300px;; height:100px; }
        section.replyForm button { font-size:15px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }

        section.replyList div.replyFooter button { font-size:14px; border: 1px solid #999; background:none; margin-right:10px; }
        section.replyList { padding:10px 0; }
        section.replyList ol { padding:0; margin:0; }
        section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
        section.replyList div.userInfo .userName { font-size:18px; font-weight:bold; }
        section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
        section.replyList div.replyContent { padding:10px; margin:20px 0; }

        div.replyModal { position:relative; z-index:1; display: none; }
        div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
        div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
        div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:480px; height:200px; }
        div.modalContent button { font-size:18px; padding:5px; margin:2px 0; background:#fff; border:1px solid #ccc; }
        div.modalContent button.modal_cancel_btnl { margin-left:20px; }
    </style>
  </head>
  <body>

  </body>
</html>
