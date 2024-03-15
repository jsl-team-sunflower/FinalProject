<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<title>비동기식 파일 첨부</title>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple> <!-- inputFile[0] -->
		<!-- <input type="file" name="uploadeFile" multiple> inputFile[1] -->
	</div>
	<button id="uploadBtn">upload</button>
	<script>
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //절규표현식 만드는 객체
		var maxsize = 5242880; //5MB
	
		function checkExt(fileName, fileSize){
			if(fileSize >= maxsize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
	
		$(function() {
			$("#uploadBtn").on("click", function() {
				var formData = new FormData(); // 가상의 form 태그
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files; //inputFile[0]의 의미는 <input> 태그의 갯수를 의미함
				console.log(files)
				
				for(var i=0; i < files.length; i++){
					if(!checkExt(files[i].name,files[i].size)){
						return false;
					}
					
					formData.append("uploadFile",files[i]);
				}
				$.ajax({
					url:'/sample/uploadAjaxAction',
					type:'post',
					data:formData,
					processData:false, //기본값은 true, 데이터를 컨텐츠타입에 맞게 변환하는 여부
					contentType:false, //spplication/json 전송, false => multipart/form-data 형식으로 전송
					success:function(result) {
						alert("전송완료");
					}
					
				})
			})
		})
	
	</script>

</body>
</html>