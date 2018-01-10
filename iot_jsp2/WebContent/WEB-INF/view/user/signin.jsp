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
						<th>Name</th>
						<td><input type="text" id="uiName" name="uiName"
							class="form-control" placeholder="Name" autofocus></td>
					</tr>
					<tr>
						<th>Age</th>
						<td><input type="text" id="uiAge" name="uiAge"
							class="form-control" placeholder="Age"></td>
					</tr>
					<tr>
						<th>ID</th>
						<td><input type="text" id="uiId" name="uiId"
							class="form-control" placeholder="ID"></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" id="uiPwd" name="uiPwd"
							class="form-control" placeholder="Password"></td>
					</tr>
					<tr>
						<th>Class</th>
						<td>
							<select name="ciNo" id="ciNo" class="form-control">
							</select>
						</td>
					</tr>
					<tr>
						<th>Address</th>
						<td><input type="text" id="address" name="address"
							class="form-control" placeholder="Address" ></td>
					</tr>
					<tr>
						<td colspan="2"> 
							<input class="ph-button ph-btn-grey " type="button"
								id="singnBtn" value="SIGN IN" onclick="signin()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
function signin(){
	//"uiName,uiAge,uiId,uiPwd,ciNo,address"
	var uiName = $("#uiName").val().trim();
	var uiAge = $("#uiAge").val().trim();
	var uiId = $("#uiId").val().trim();
	var uiPwd = $("#uiPwd").val().trim();
	var ciNo = $("#ciNo").val();
	var address = $("#address").val().trim();
	var param= {uiName:uiName, uiAge:uiAge, uiId:uiId, uiPwd:uiPwd,ciNo:ciNo,address:address};
	param = "param=" + JSON.stringify(param);
	$.ajax({
		url : '/user/signin',
		type : 'post',
		data : param,
		success:function(res){
			var obj = JSON.parse(res);
			alert(obj.msg);
			if(obj.result=="ok"){
				location.href="/view/user/login";
			}
		},
		error:function(xhr,status,error){
			
		}		
	})
}
$(document).ready(function(){
	$.ajax({
		url : '/class/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str = "";
			for(var ci of list){
				str += "<option value='" + ci.ciNo + "'>" + ci.ciName +"</option>";
			}
			//document.getElementById("ciNo").insertAdjacentHTML("beforeend",str);
			$("#ciNo").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>
</html>