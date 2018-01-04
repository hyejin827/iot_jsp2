<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>


$(document).ready(function(){
	$.ajax({
		url : '/class/list',
		type : 'get',
		success : function(res){
			//alert(res);
			var list = JSON.parse(res);
			var str = "";
			for(var ci of list){
				console.log(ci.ciName);
				str += "<option value='"+ci.ciNo+"'>"+ci.ciName+"</option>";
			}
			document.getElementById("ciNo").insertAdjacentHTML("beforeend",str);
			//$("#ciNo").html(str);
		},
		error : function(xhr,status,error){
			
		}
	})
});
</script>
<body>
	<jsp:include page="/WEB-INF/view/common/header.jsp" flush="false" />
	<div align="center"><img src ="http://cfile10.uf.tistory.com/image/274B203A5914537B2F50DD" width=400></div>
	
	<div class="container">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="uiName" name="uiName" class="form-control"
					placeholder="이름" autofocus>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" id="uiAge" name="uiAge" class="form-control"
					placeholder="나이">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="uiId" name="uiId" class="form-control"
					placeholder="아이디">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" id="uiPwd" name="uiPwd" class="form-control"
					placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<th>반</th>
				<td>
					<select class="form-control" name="ciNo" id="ciNo">
					
					</select>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="address" name="address" class="form-control"
					placeholder="주소">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input class="btn btn-lg btn-primary btn-block" type="button"
					id="SigninBtn" value="Signin" onclick="signin()">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>