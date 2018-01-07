<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/style_list.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jsp" flush="false" />

	<table class="myTable myTable-rounded">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>ID</th>
				<th>가입일자</th>
				<th>주소</th>
				<th><em class="glyphicon glyphicon-asterisk"></em></th>
			</tr>
		</thead>
		<tbody id="result_tb">
		</tbody>
	</table>
</body>


<script>
$(document).ready(function(){
	$.ajax({
		url : '/user/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var uc of list){
				str += "<tr>";
				str += "<td class='text-center'>" + uc.uiNo + "</td>";
				str += "<td class='text-center'>" + uc.uiName + "</td>";
				str += "<td class='text-center'>" + uc.uiAge + "</td>";
				str += "<td class='text-center'>" + uc.uiId + "</td>";
				str += "<td class='text-center'>" + uc.uiRegdate + "</td>";
				str += "<td class='text-center'>" + uc.address + "</td>";
				str += '<td align="center">';
				str += '<a class="btn btn-default"><em class="glyphicon glyphicon-refresh"></em></a>';
				str += '<a class="btn btn-danger"><em class="glyphicon glyphicon-trash"></em></a>';
				str += '</td>';
			}
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>

</html>