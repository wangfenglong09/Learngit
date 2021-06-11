<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

	<script type="text/javascript">

	//页面加载完毕
	$(function()
	{
		//导航中所有文本颜色为黑色
		$(".liClass > a").css("color" , "black");
		
		//默认选中导航菜单中的第一个菜单项
		$(".liClass:first").addClass("active");
		
		//第一个菜单项的文字变成白色
		$(".liClass:first > a").css("color" , "white");
		
		//给所有的菜单项注册鼠标单击事件
		$(".liClass").click(function()
		{
			//移除所有菜单项的激活状态
			$(".liClass").removeClass("active");
			//导航中所有文本颜色为黑色
			$(".liClass > a").css("color" , "black");
			//当前项目被选中
			$(this).addClass("active");
			//当前项目颜色变成白色
			$(this).children("a").css("color","white");
		});
		
		//展示商品页面
		window.open("${pageContext.request.contextPath}/product/index","workareaFrame");


		//修改密码的模态窗口_更新按钮点击事件
		$("#updateBtn").click(function()
		{
			var oldPwd = $("#oldPwd").val();
			var newPsw = $("#newPwd").val();
			var confirmPwd = $("#confirmPwd").val();

			$.ajax
			({
				url:"${pageContext.request.contextPath}/product/updatePassWord",
				type:"post",
				data:{"newPsw":newPsw,"confirmPwd":confirmPwd,"oldPwd":oldPwd},
				beforeSend:function()
				{
					var flag = true;

					//触发每一个input的onblur()事件
					$("#passwordForm input[type='text']").blur();

					//获取每一个class的标签的内容，类选择器
					$.each($(".requireSpan"),function(i,n)
					{
						var spanText = $(n).text();
						if(spanText != "")
						{
							flag = false;
						}
					});
					console.log("flag="+flag);

					return flag;
				},
				success:function(jsonObject)
				{
					if(jsonObject.success)
					{
						$("#editPwdModal").modal('hide');  //手动关闭模态窗口
					}
					else
					{
						alert("更新失败");
					}
				}
			});
		});


		//取消按钮
		$("#cancleBtn").click(function()
		{
			$("#oldPwd").val("");
			$("#newPwd").val("");
			$("#confirmPwd").val("");
			$("#checkOldPwdMsg").text("");
			$("#checkNewPwdMsg").text("");
			$("#checkconfirmPwdMsg").text("");
		});
		
	});

	//检查原密码
	function checkOldPwd()
	{
		//原密码不能为空
		var oldPwd = $("#oldPwd").val();
		if(oldPwd == "")
		{
			$("#checkOldPwdMsg").text("原密码不能为空");
		}
		else
		{
			$.ajax
			({
				url:"${pageContext.request.contextPath}/product/verifyOldPassWord",
				type:"post",
				data:{"oldPwd":oldPwd},
				beforeSend:function()
				{
					return true;
				},
				success:function(jsonObject)
				{
					if(jsonObject.success)
					{
						$("#checkOldPwdMsg").text("");
					}
					else
					{
						$("#checkOldPwdMsg").text("原密码不正确");
					}
				}
			});
		}
	}

	//修改密码---弹出模态框
	function PopUpEditPwdModal()
	{
		//弹出模态窗口
		$("#editPwdModal").modal({backdrop: 'static', keyboard: false});
	}

	//检查新密码
	function checkNewPwd()
	{
		var newPsw = $("#newPwd").val();
		if(newPsw == "")
		{
			$("#checkNewPwdMsg").text("新密码不能为空");
		}
		else
		{
			$("#checkNewPwdMsg").text("");
		}
	}

	//检查确认密码
	function checkConfirmPwd()
	{
		var confirmPwd = $("#confirmPwd").val();
		var newPsw = $("#newPwd").val();
		if(confirmPwd == "")
		{
			$("#checkconfirmPwdMsg").text("确认密码不能为空");
		}
		else if(confirmPwd != newPsw)
		{
			$("#checkconfirmPwdMsg").text("确认密码和新密码不一样");
		}
		else
		{
			$("#checkconfirmPwdMsg").text("");
		}
	}



</script>

</head>
<body>
	
	<!-- 我的资料 -->
	<div class="modal fade" id="myInformation" role="dialog">
		<div class="modal-dialog" role="document" style="width: 30%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">我的资料</h4>
				</div>
				<div class="modal-body">
					<div style="position: relative; left: 40px;">
						姓名：<b>${customer_session.nickname}</b><br><br>
						登录帐号：<b>${customer_session.phone}</b><br><br>
						组织机构：<b>1005，市场部，二级部门s</b><br><br>
						邮箱：<b>zhangsan@qq.com</b><br><br>
						失效时间：<b>2017-02-14 10:10:10</b><br><br>
						允许访问IP：<b>127.0.0.1,192.168.100.2</b>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 修改密码的模态窗口 -->
	<div class="modal fade" id="editPwdModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 70%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">修改密码</h4>
				</div>
				<div class="modal-body">
					<form id="passwordForm" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="oldPwd" class="col-sm-2 control-label">原密码</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="oldPwd" name="oldPwd" onblur="checkOldPwd();" style="width: 200%;">
								<span id="checkOldPwdMsg" class="requireSpan" style="color:red;"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label for="newPwd" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="newPwd" name="newPwd" onblur="checkNewPwd();" style="width: 200%;">
								<span id="checkNewPwdMsg" class="requireSpan" style="color:red;"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label for="confirmPwd" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10" style="width: 300px;">
								<input type="text" class="form-control" id="confirmPwd" name="confirmPwd" onblur="checkConfirmPwd();" style="width: 200%;">
								<span id="checkconfirmPwdMsg" class="requireSpan" style="color:red;"></span>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="cancleBtn" class="btn btn-default" data-dismiss="modal">取消</button>
					<%--<button type="button" id="updateBtn" class="btn btn-primary" data-dismiss="modal">更新</button>--%>
					<%--data-dismiss="modal"表示关闭模态窗口--%>
					<%--<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="window.location.href='../login.html';">更新</button>--%>
					<button type="button" id="updateBtn" class="btn btn-primary">更新</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 退出系统的模态窗口 -->
	<div class="modal fade" id="exitModal" role="dialog">
		<div class="modal-dialog" role="document" style="width: 30%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">离开</h4>
				</div>
				<div class="modal-body">
					<p>您确定要退出系统吗？</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

					<button type="button" class="btn btn-primary" data-dismiss="modal"
							onclick="window.location.href='${pageContext.request.contextPath}/product/indexExit';">确定
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 顶部 -->
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">Springboot后台 &nbsp;<span style="font-size: 12px;">&copy;2019红领巾小胡子&nbsp;JDPT</span></div>
		<div style="position: absolute; top: 15px; right: 15px;">
			<ul>
				<li class="dropdown user-dropdown">
					<a href="javascript:void(0)" style="text-decoration: none; color: white;" class="dropdown-toggle" data-toggle="dropdown">
						<%--<span class="glyphicon glyphicon-user"></span> zhangsan <span class="caret"></span>--%>
						<span class="glyphicon glyphicon-user"></span> ${customer_session.nickname} <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="../settings/index.html"><span class="glyphicon glyphicon-wrench"></span> 系统设置</a></li>
						<li><a href="javascript:void(0)" data-toggle="modal" data-target="#myInformation"><span class="glyphicon glyphicon-file"></span> 我的资料</a></li>
						<li><a href="javascript:PopUpEditPwdModal()" data-toggle="modal" data-target="#editPwdModal"><span class="glyphicon glyphicon-edit"></span> 修改密码</a></li>
						<li><a href="javascript:void(0);" data-toggle="modal" data-target="#exitModal"><span class="glyphicon glyphicon-off"></span> 退出</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	<!-- 中间 -->
	<div id="center" style="position: absolute;top: 50px; bottom: 30px; left: 0px; right: 0px;">
	
		<!-- 导航 -->
		<div id="navigation" style="left: 0px; width: 18%; position: relative; height: 100%; overflow:auto;">
		
			<ul id="no1" class="nav nav-pills nav-stacked">
				<li class="liClass"><a href="${pageContext.request.contextPath}/product/index" target="workareaFrame">
					<span class="glyphicon glyphicon-briefcase"></span> 商品管理</a></li>
				<li class="liClass"><a href="workbench/order/index.html" target="workareaFrame">
					<span class="glyphicon glyphicon-shopping-cart"></span> 销售订单</a></li>
			</ul>
			
			<!-- 分割线 -->
			<div id="divider1" style="position: absolute; top : 0px; right: 0px; width: 1px; height: 100% ; background-color: #B3B3B3;"></div>
		</div>
		
		<!-- 工作区 -->
		<div id="workarea" style="position: absolute; top : 0px; left: 18%; width: 82%; height: 100%;">
			<iframe style="border-width: 0px; width: 100%; height: 100%;" name="workareaFrame"></iframe>
		</div>
		
	</div>
	
	<div id="divider2" style="height: 1px; width: 100%; position: absolute;bottom: 30px; background-color: #B3B3B3;"></div>
	
	<!-- 底部 -->
	<div id="down" style="height: 30px; width: 100%; position: absolute;bottom: 0px;"></div>
	
</body>
</html>