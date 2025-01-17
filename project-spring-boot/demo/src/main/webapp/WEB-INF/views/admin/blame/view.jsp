<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">

<title>Insert title here</title>

</head>
<style>
.creadted_settingTitle{
	border-bottom: 1px solid rgb(230, 230, 230);
}

.container-header{
	width: 100%;
	padding: 32px 16px 24px;
	word-break: break-all;
	box-sizing: inherit;
	display: block;
	width: 1080px;
    margin: 0px auto;    
	
}
.container-header h1{
	margin: 0;
    padding: 0;
    font-size: 30px;
    line-height: 45px;
    letter-spacing: -0.03em;
    font-weight: 300;
}
.container-container{
	padding: 32px 24px 120px;
	width: 1080px;
    margin: 0px auto;
}
h3, p, div {
    word-break: break-all;
}
div {
    display: block;
}
body {
    margin: 0px;
    padding: 0px;
    overflow-x: hidden;
    min-width: 320px;    
    font-family: 'SpoqaHanSans', 'Helvetica Neue', Arial, Helvetica, sans-serif;
    font-size: 14px;
    line-height: 1.7em;
    color: rgba(0, 0, 0, 0.87);
    font-smoothing: antialiased;
}
#summernote-title{
	width: 1080px;
	border: 1px solid #ddd;
    border-radius: 4px;
    padding: 10px;
    font-weight: 400;
    max-width: 100%;
    box-sizing: border-box;
    outline: none;
    transition: border .12s ease-in-out;
    color: #000;
    font-size: 14px;
    margin-bottom: 10px;
}
#writeBtn,
#resetBtn,
#listBtn{
	min-width: 90px;
    height: 30px;
    border-radius: 4px;
    border: 0;
    font-size: 12px;
  	font-weight: bold;
    color: #ffffff;
    background-color: rgba(0, 0, 0, 1);   
    line-height: 2.72;
    vertical-align: middle;
	float: right;
	margin-bottom: 10px;
	margin-left: 5px;
}
#resetBtn{
	color: #666;
    border: 1px solid #959595;
    background-color: #fff;
}
</style>

<script>
	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote ({
			  height: 100,                 // 
			  minHeight: 70,             // 
			  maxHeight: null,             // 
			  focus: true,                  //
			  lang: "ko-KR",					// 		 
	          
		});	
		$("#summernote").summernote('code', '${info.REPLY}');	
		
		$("#resetBtn").click(function(){
			$("#summernote").summernote('code', '${info.REPLY}');
		});
		
		$("#writeBtn").click(function(){
		
			var goUrl = "/admin/blame/registReply";
		
			if ("${info.REPLY_YN}" == "Y") {
				goUrl = "/admin/blame/modifyReply";
			}
			
				
			
			var params = {
				BLAME_ID: "${info.ID}",
				CONTENT: $('#summernote').summernote('code')
			}
			
			$.ajax({
				url: goUrl,
				type: "post",
				data: JSON.stringify(params),
				dataType: "json",
				contentType: "application/json",
				success: function(data) {
					if (data.resultCode == "RSLT0000") {
					
						alert("답변을 등록하였습니다.");
					} else {
					
						alert(data.resultMessage);
					}
				},
				error: function(request,status,error) {
				    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		});
			
		$("#listBtn").click(function(){
			location.href = "/admin/blame/list";
		});
	});
</script>
<body>
	
	
	
	<div class="creadted_settingTitle">
		<div class="container-header">
			<h1>신고답변</h1>
		</div>		
	</div>
	
	<div class="container-container">
		<form id="writeForm" method="post" onsubmit="return false">
			<div style="white-space:pre;padding:10px;margin-bottom:10px;min-height:200px;border:solid 1px #aaaaaa;">${info.CONTENT}</div>
			<textarea id="summernote" name="reply"></textarea>			
		</form>	
		<div style="margin:10px;text-align:center;">
			<div style="float:left">
				<button id="listBtn" type="button">목록</button>
			</div>
			<div style="float:right">
				<button id="resetBtn" type="reset">취소</button>
				<button id="writeBtn" type="button">저장</button>
			</div>
		</div>
	</div>
</body>
</html>