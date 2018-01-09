<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/classlist.css" />
<body>
<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
<div class="container">
		<div class="row">

			<div class="col-md-10 col-md-offset-1">

				<div class="panel panel-default panel-table">
					<div class="panel-heading">
						<div class="row">
							<div class="col col-xs-6">
								<h3 class="panel-title">Class List</h3>
							</div>
							<div class="col col-xs-6 text-right">
								<input type="text" class="input">
								<button type="button" class="btn btn-sm btn-primary btn-create">검색</button>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<table id="grid1" data-key="ciNo" class="table table-striped table-bordered table-list">
							<thead>
								<tr>
									<th class="text-center" data-field="ciNo,ro">번호</th>
									<th class="text-center" data-field="ciName,txt">이름</th>
									<th class="text-center" data-field="ciDesc,txt">반</th>
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
function updateClass(ciNo){
	var ciName = $("#ciName" + ciNo).val().trim();
	var ciDesc = $("#ciDesc" + ciNo).val().trim();
	var param = {ciNo:ciNo, ciName:ciName, ciDesc:ciDesc};
	param = "param=" + JSON.stringify(param);
		$.ajax({
			url : '/class/update',
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

function deleteClass(ciNo){
	var isDelete = confirm("진짜 지우게?");
	var param= "ciNo="+ciNo;
	if(isDelete){
		$.ajax({
			url : '/class/delete',
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
		url : '/class/list',
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
						str += '<a class="btn btn-default" onclick="updateClass('+key+')"><em class="glyphicon glyphicon-refresh"></em></a>';
						str += '<a class="btn btn-default" onclick="deleteClass('+key+')"><em class="glyphicon glyphicon-trash"></em></a>';
					}else{
						var colName = field.split(",")[0];
						var colType = field.split(",")[1];
						if(colType=="ro"){
							str += uc[colName];
						}else{
							str += "<input type='text' class='form-control' id='" + colName + key + "' value='" + uc[colName] + "'>";
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
</script>
</html>