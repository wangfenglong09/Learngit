<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<link href="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/jquery/bs_pagination/css/jquery.bs_pagination.min.css" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bs_pagination/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bs_pagination/js/localization/en.js"></script>
<script type="text/javascript">
	$(function()
	{
		//分页查询
		display(1,5);

		//修改编辑按钮点击事件
		$("#editBtn").click(function()
		{
			var checkBoxElts = $("#productInfoTBody input[type='checkbox']:checked");
			if(checkBoxElts.length == 0)
			{
				alert("请选择您要修改的商品");
			}
			else if(checkBoxElts.length > 1)
			{
				alert("一次只能编辑一个选中的商品信息");
			}
			else
			{
				//alert("henaho="+checkBoxElts.val());
				window.location.href="${pageContext.request.contextPath}/product/edit?productId="+checkBoxElts.val();
			}
		});

		//全选或者取消全选
		$("#checkOrcancelAll").click(function()
		{
			$("#productInfoTBody :checkbox").prop("checked",this.checked); //拼接的checkbox全选
		});

		//删除按钮事件
		$("#deleteBtn").click(function()
		{
			//拿到选中的checkbox
			var checkedElts = $("#productInfoTBody :checkbox:checked");
			if(checkedElts.length == 0)
			{
				alert("请选择要删除的数据");
			}
			else
			{
				// ids=    1&ids=2&ids=3&ids=4
				var sendData ="ids=";
				var idArray = [];

				//拿到选中的checkbox的id值
				$.each(checkedElts,function(i,n)
				{
					idArray.push($(n).val());
				});

				sendData += idArray.join("&ids=");
				//alert(sendData);

				$.ajax
				({
					url:"${pageContext.request.contextPath}/product/delete",
					type:"post",
					data:sendData, //ids=1&ids=2&ids=3&ids=4
					beforeSend:function()
					{
						return true;
					},
					success:function(jsonObject)
					{
						if(jsonObject.success)
						{
							display(1,5);
						}
						else
						{
							alert("删除失败");
						}
					}
				});
			}
		});

	});

	function display(pageNo,pageSize)
	{
		//每次查询都要将上一次的查询清空
		$("#productInfoTBody").empty();

		//每次点击下一页的时候都要清除checkbox的选中属性
		$("#checkOrcancelAll").prop("checked",false);

		//发送ajax去后台查询数据
		$.ajax
		({
			url:"${pageContext.request.contextPath}/product/getProductsByPage",
			type:"get", // get:往往是向服务获取数据 post:往往是向服务发送数据
			data:
			{
				"pageNo":pageNo,
				"pageSize":pageSize,
				"productNo":$("#productNo").val(),
				"title":$("#title").val(),
				"price":$("#price").val(),
				"sellPoint":$("#sellPoint").val(),
				"status":$("#status").val()
			},
			beforeSend:function()
			{
				return true;
			},
			success:function(jsonObject)
			{
				var htmlString = ""; //后台查询出来的数据拼装的html
				//有数据
				if(jsonObject.total > 0)
				{
					$.each(jsonObject.dataList,function(i,n)
					{
						var status = "";
						switch(n.status)
						{
							case "0":
								status = "发布";
								break;
							case "1":
								status = "未发布";
								break;
							case "2":
								status = "失效";
								break;
						}

						htmlString += '<tr>';
						htmlString += '<td><input type="checkbox" onclick="controllerCheckOrCancelAll();" value="'+n.id+'" /></td>';
						htmlString += '<td><a style="text-decoration: none; cursor: pointer;" ' +
								'onclick="window.location.href=\'product/detail?productId=' + n.id +'\';">'+n.productno+'</a></td>';
						htmlString += '<td>'+n.title+'</td>';
						htmlString += '<td>'+n.price+'</td>';
						htmlString += '<td>'+status+'</td>';
						htmlString += '<td>'+n.sellpoint+'</td>';
						htmlString += '</tr>';
					});
					//拼装到动态tbody中
					$("#productInfoTBody").append(htmlString);

					//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
					//分页查询实现，bootstrap的分页查询插件
					//根据总条数计算总页数
					var totalCount=jsonObject.total;
					var totalPages=1;
					//如果能整除,则totalPages为商
					if(totalCount%pageSize==0)
					{
						totalPages=totalCount/pageSize;
						//如果不能整除,则totalPages为商的整数部分+1
					}
					else
					{
						totalPages=parseInt(totalCount/pageSize)+1;
					}

					$("#pageNoDiv").bs_pagination
					({
						currentPage: pageNo,//要显示的当前页
						rowsPerPage: pageSize,//每页显示条数
						totalPages: totalPages,//总页数
						totalRows: totalCount,//总条数
						visiblePageLinks: 3,//显示卡片数量
						showGoToPage: true,//是否显示跳转到第几页
						showRowsPerPage: true,//是否显示每页多少条
						showRowsInfo: true,//是否显示记录信息
						onChangePage: function(event,pageObj)
						{
							// returns page_num and rows_per_page after a link has clicked
							display(pageObj.currentPage,pageObj.rowsPerPage)
						}
					});
					//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
				}
				else
				{
					alert("查询无数据！");
				}
			}
		});
	}

	//反全选事件 因为是动态生成的不能用click()事件
	function controllerCheckOrCancelAll()
	{
		//checkbox的个数和选中的个数相等就全选
		$("#checkOrcancelAll").prop("checked",$("#productInfoTBody :checkbox").length == $("#productInfoTBody :checkbox:checked").length);
	}


</script>

</head>
<body>

	<div style="width: 80%">
		<div style="position: relative; left: 10px; top: -10px;">
			<div class="page-header">
				<h3>LIST_OF_GOODS</h3>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
	
		<div style="width: 80%; position: absolute;top: 5px; left: 10px;">
		
			<div class="btn-toolbar" role="toolbar" style="height: 80px;">
				<form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">商品编号</div>
				      <input class="form-control" type="text" id="productNo">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">商品标题</div>
				      <input class="form-control" type="text" id="title">
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">商品单价</div>
				      <input class="form-control" type="text" id="price">
				    </div>
				  </div>
				  
				  <br>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">商品卖点</div>
				      <input class="form-control" type="text" id="sellPoint">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <div class="input-group">
				      <div class="input-group-addon">商品状态</div>
					  <select class="form-control" id="status">
					  	<option></option>
					    <option value="0">已发布</option>
					    <option value="1">未发布</option>
					    <option value="2">失效</option>
					  </select>
				    </div>
				  </div>
				  
				  <button type="button" onclick="display(1,5);" class="btn btn-default">查询</button>
				   <span id="message" style="color:red;font-size:16px;"></span>
				</form>
			</div>

			<div class="btn-toolbar" role="toolbar" style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
				<div class="btn-group" style="position: relative; top: 18%;">
				  <button type="button" class="btn btn-primary" onclick="window.location.href='${pageContext.request.contextPath}/product/add';">
					  <span class="glyphicon glyphicon-plus"></span> 创建</button>

				  <button type="button" class="btn btn-default" id="editBtn">
					  <span class="glyphicon glyphicon-pencil"></span> 修改</button>

				  <button type="button" id="deleteBtn" class="btn btn-danger">
					  <span class="glyphicon glyphicon-minus"></span> 删除
				  </button>
				</div>
			</div>

			<div style="position: relative;top: 10px;" >
				<table class="table table-hover">
					<thead>
						<tr style="color: #B3B3B3;">
							<td><input type="checkbox" id="checkOrcancelAll" /></td>
							<td>商品编号</td>
							<td>商品标题</td>
							<td>商品单价</td>
							<td>商品状态</td>
							<td>商品卖点描述</td>
						</tr>
					</thead>
					<tbody id="productInfoTBody">
						<!-- 查询数据 -->
						<!--
						<tr>
							<td><input type="checkbox" /></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/product/detail';">HonorH10001</a></td>
							<td>荣耀8，5寸大屏</td>
							<td>1999.0</td>
							<td>未发布</td>
							<td>荣耀8，5寸大屏！不要99，不要199，只卖1999！</td>
						</tr>
						<tr>
							<td><input type="checkbox" /></td>
							<td><a style="text-decoration: none; cursor: pointer;" onclick="window.location.href='${pageContext.request.contextPath}/product/detail';">HonorH10001</a></td>
							<td>荣耀8，5寸大屏</td>
							<td>1999.0</td>
							<td>未发布</td>
							<td>荣耀8，5寸大屏！不要99，不要199，只卖1999！</td>
						</tr>
						-->
					</tbody>
				</table>
			</div>

			<div id="pageNoDiv">
				<!--分页查询插件-->
			</div>

			<!--
			<div style="height: 50px; position: relative;top: 30px;">
				<div>
					<button type="button" class="btn btn-default" style="cursor: default;">共<b>50</b>条记录</button>
				</div>
				<div class="btn-group" style="position: relative;top: -34px; left: 110px;">
					<button type="button" class="btn btn-default" style="cursor: default;">显示</button>
					<div class="btn-group">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							10
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">20</a></li>
							<li><a href="#">30</a></li>
						</ul>
					</div>
					<button type="button" class="btn btn-default" style="cursor: default;">条/页</button>
				</div>
				<div style="position: relative;top: -88px; left: 285px;">
					<nav>
						<ul class="pagination">
							<li class="disabled"><a href="#">首页</a></li>
							<li class="disabled"><a href="#">上一页</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">下一页</a></li>
							<li class="disabled"><a href="#">末页</a></li>
						</ul>
					</nav>
				</div>
			</div>
			-->
			
		</div>
		
	</div>
</body>
</html>