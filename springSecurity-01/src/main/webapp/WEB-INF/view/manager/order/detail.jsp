<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="../../jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="../../jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

	//默认情况下取消和保存按钮是隐藏的
	var cancelAndSaveBtnDefault = true;
	
	$(function(){
		
		$(".myHref").mouseover(function(){
			$(this).children("span").css("color","red");
		});
		
		$(".myHref").mouseout(function(){
			$(this).children("span").css("color","#E6E6E6");
		});
	});
	
</script>

</head>
<body>

	<!-- 返回按钮 -->
	<div style="position: relative; top: 35px; left: 10px;">
		<a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left" style="font-size: 20px; color: #DDDDDD"></span></a>
	</div>
	
	<!-- 大标题 -->
	<div style="position: relative; left: 40px; top: -30px;">
		<div class="page-header">
			<h3>订单编号：201212120256&nbsp;&nbsp;&nbsp;<small>
			<font style="color:red;">待支付</font>
			</small></h3>
		</div>
		<div style="position: relative; height: 50px; width: 500px;  top: -72px; left: 700px;"></div>
	</div>
	
	<!-- 用户详细信息 -->
	<div style="position: relative; top: -70px;">
		<div style="position: relative; left: 40px; height: 30px;">
			<div style="width: 300px; color: gray;">用户编号</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>201225253636001</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">用户昵称</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>木U</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; left: 40px; height: 30px;">
			<div style="width: 300px; color: gray;">手机号</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>13899991111</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">注册时间</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>201202022312</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
	</div>
		
	<!-- 收货地址信息 -->
	<div style="position: relative; top: -60px; left: 40px;">
		<div class="page-header">
			<h4>收货信息</h4>
		</div>
		<div style="position: relative; height: 30px; top: 10px;">
			<div style="width: 300px; color: gray;">收货人姓名</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>张三</b></div>
			<div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">收货人手机号</div>
			<div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>13910008888</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
		</div>
		<div style="position: relative; height: 30px; top: 30px;">
			<div style="width: 300px; color: gray;">收货地址</div>
			<div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>上海市闵行区大学路203弄</b></div>
			<div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
		</div>
	</div>
	
	<!-- 购买商品 -->
	<div>
		<div style="position: relative; top: -50px; left: 40px;">
			<div class="page-header">
				<h4>购买商品</h4>
			</div>
			<div style="position: relative;top: 0px;">
				<table id="activityTable" class="table table-hover" style="width: 900px;">
					<thead>
						<tr style="color: #B3B3B3;">
							<td>商品编号</td>
							<td>商品标题</td>
							<td>商品单价</td>
							<td>购买数量</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>201212252363</td>
							<td>华为荣耀6p</td>
							<td>1999</td>
							<td>1</td>
						</tr>
						<tr>
							<td>201212252389</td>
							<td>小米Note2</td>
							<td>1690</td>
							<td>2</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 备注 -->
	<div style="position: relative; top: -60px; left: 40px;">
		<div class="page-header">
			<h4>备注</h4>
		</div>
		
		<div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
			<form role="form" style="position: relative;top: 10px; left: 10px;">
				<textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"  placeholder="添加备注...">记得送手机壳</textarea>
			</form>
		</div>
	</div>
	
	<div style="height: 200px;"></div>
</body>
</html>