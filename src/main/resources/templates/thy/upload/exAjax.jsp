<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<title>�񵿱�� ���� ÷��</title>
</head>
<body>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple> <!-- inputFile[0] -->
		<!-- <input type="file" name="uploadeFile" multiple> inputFile[1] -->
	</div>
	<button id="uploadBtn">upload</button>
	<script>
	
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //����ǥ���� ����� ��ü
		var maxsize = 5242880; //5MB
	
		function checkExt(fileName, fileSize){
			if(fileSize >= maxsize){
				alert("���� ������ �ʰ�");
				return false;
			}
			if(regex.test(fileName)){
				alert("�ش� ������ ���ε� �� �� �����ϴ�.");
				return false;
			}
			return true;
		}
	
		$(function() {
			$("#uploadBtn").on("click", function() {
				var formData = new FormData(); // ������ form �±�
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files; //inputFile[0]�� �ǹ̴� <input> �±��� ������ �ǹ���
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
					processData:false, //�⺻���� true, �����͸� ������Ÿ�Կ� �°� ��ȯ�ϴ� ����
					contentType:false, //spplication/json ����, false => multipart/form-data �������� ����
					success:function(result) {
						alert("���ۿϷ�");
					}
					
				})
			})
		})
	
	</script>

</body>
</html>