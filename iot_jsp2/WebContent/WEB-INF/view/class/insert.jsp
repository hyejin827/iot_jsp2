<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/style_signin.css" />
<link rel="stylesheet" href="<%=rootPath%>/ui/css/btn_signin.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />

	<div class="container">
		<div class="wrapper">

			<form class="form-signin">
				<table class="table">
					<tr>
						<th>Class Name</th>
						<td><input type="text" id="ciName" name="ciName"
							class="form-control" placeholder="ciName" autofocus></td>
					</tr>
					<tr>
						<th>Description</th>
						<td><input type="text" id="ciDesc" name="ciDesc"
							class="form-control" placeholder="ciDesc"></td>
					</tr>
					<tr>
						<td colspan="2"> 
							<input class="ph-button ph-btn-grey " type="button"
								id="singnBtn" value="INSERT" onclick="insert()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
function insert(){
	var ciName = $("#ciName").val().trim();
	var ciDesc = $("#ciDesc").val().trim();
	var param= {ciName:ciName, ciDesc:ciDesc};
	param = "param=" + JSON.stringify(param);
	$.ajax({
		url : '/class/signin',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				location.href="/view/class/classlist";
			}
		},
		error:function(xhr,status,error){
			
		}		
	})
}

</script>
</html>