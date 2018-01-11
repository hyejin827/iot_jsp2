<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
	<br>
	<div class="container">
		<div class="row">

			<div class="col-md-10 col-md-offset-1">

				<div class="panel panel-default panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-xs-6">
								<h3 class="panel-title">User List</h3>
							</div>
							<div class="col col-xs-6 text-right">
								<input type="text" id="search" class="input" placeholder="Enter User Number">
								<button type="button" class="btn btn-sm btn-primary btn-create" onclick="search()">검색</button>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table id="grid1" data-key="uiNo" class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									<th class="text-center" data-field="uiNo,ro">Number</th>
									<th class="text-center" data-field="uiName,txt">Name</th>
									<th class="text-center" data-field="uiAge,txt">Age</th>
									<th class="text-center" data-field="uiId,ro">ID</th>
									<th class="text-center" data-field="uiRegdate,ro">Regdate</th>
									<th class="text-center" data-field="address,txt">Address</th>
									<th class="text-center" data-field="BTN"><em
										class="glyphicon glyphicon-asterisk"></em></th>
								</tr>
							</thead>
							<tbody id="result_tb">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
function updateUser(uiNo){
	var uiName = $("#uiName" + uiNo).val().trim();
	var uiAge = $("#uiAge" + uiNo).val().trim();
	var address = $("#address" + uiNo).val().trim();
	var param = {uiNo:uiNo, uiName:uiName, uiAge:uiAge, address:address};
	param = "param=" + JSON.stringify(param);
		$.ajax({
			url : '/user/update',
			type : 'post',
			data : param,
			dataType : 'json',
			success:function(res){
				alert(res.msg);
				if(res.result=="ok"){
					location.reload();
				}
			},
			error:function(xhr,status,error){
			
			}
		})
}

function deleteUser(uiNo){
	var isDelete = confirm("진짜 지우게?");
	var param= "uiNo="+uiNo;
	if(isDelete){
		$.ajax({
			url : '/user/delete',
			type : 'post',
			data : param,
			dataType : 'json',
			success:function(res){
				alert(res.msg);
				if(res.result=="ok"){
					location.reload();
				}
			},
			error:function(xhr,status,error){
			
			}
		})
	}
}
var colsInfo = [];
//var colsInfo = new Array; 도 가능
$(document).ready(function(){
	var colList = $("#grid1 th[data-field]");
	for(var i=0; i<colList.length;i++){
		colsInfo.push(colList[i].getAttribute("data-field")); //push는 add랑 같은거
	}
	var keyCol =$("#grid1").attr("data-key");
	$.ajax({
		url : '/user/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var uc of list){
				var key = uc[keyCol];
				str +="<tr>";
				for(var field of colsInfo){
					str += "<td class='text-center'>";
					if(field=="BTN"){
						str += '<a class="btn btn-default" onclick="updateUser('+key+')"><em class="glyphicon glyphicon-refresh"></em></a>';
						str += '<a class="btn btn-default" onclick="deleteUser('+key+')"><em class="glyphicon glyphicon-trash"></em></a>';
					}else{
						var colName = field.split(",")[0];
						var colType = field.split(",")[1];
						if(colType=="ro"){
							str += uc[colName];
						}else{
							str += "<input type='text' class='form-control go' id='" + colName + key + "' value='" + uc[colName] + "'>";
						}
					}
					str += "</td>";
				}
				str += "</tr>";
			}
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});


function search(){
	var colsInfo = [];
	var param = "param=" +	$("#search").val().trim();
	var colList = $("#grid1 th[data-field]");
	for(var i=0; i<colList.length;i++){
		colsInfo.push(colList[i].getAttribute("data-field")); //push는 add랑 같은거
	}
	var keyCol =$("#grid1").attr("data-key");
	$.ajax({
		url : '/user/search',
		type : 'get',
		data : param,
		success:function(res){
			var str ="";
			if(res.trim()!="null"){
				var uc = JSON.parse(res);
				var key = uc[keyCol];
				str +="<tr>";
				for(var field of colsInfo){
					str += "<td class='text-center'>";
					if(field=="BTN"){
						str += '<a class="btn btn-default" onclick="updateUser('+key+')"><em class="glyphicon glyphicon-refresh"></em></a>';
						str += '<a class="btn btn-default" onclick="deleteUser('+key+')"><em class="glyphicon glyphicon-trash"></em></a>';
					}else{
						var colName = field.split(",")[0];
						var colType = field.split(",")[1];
						if(colType=="ro"){
							str += uc[colName];
						}else{
							str += "<input type='text' class='form-control go' id='" + colName + key + "' value='" + uc[colName] + "'>";
						}
					}
					str += "</td>";
				}
				str += "</tr>";
			}else{
				alert("검색 결과가 없습니다.");
			}
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
}
</script>
</html>