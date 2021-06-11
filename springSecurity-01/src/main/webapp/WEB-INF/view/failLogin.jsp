<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>login</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/failLoginJsp/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/failLoginJsp/css/demo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/failLoginJsp/js/vendor/jgrowl/css/jquery.jgrowl.min.css">
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/failLoginJsp/css/component.css" />
<!--[if IE]>
<script  type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/html5.js"></script>
<![endif]-->
<style>
	input::-webkit-input-placeholder{
		color:rgba(0, 0, 0, 0.726);
	}
	input::-moz-placeholder{   /* Mozilla Firefox 19+ */
		color:rgba(0, 0, 0, 0.726);
	}
	input:-moz-placeholder{    /* Mozilla Firefox 4 to 18 */
		color:rgba(0, 0, 0, 0.726);
	}
	input:-ms-input-placeholder{  /* Internet Explorer 10-11 */ 
		color:rgba(0, 0, 0, 0.726);
	}
</style>
</head>
<script type="text/javascript">
	$(function()
	{

	});
</script>

<body>
		<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>MARS HELP 登陆失败页面</h3>
						<form action="${pageContext.request.contextPath}/hello" name="f" method="post">
							<%--<div class="input_outer">
								<span class="u_user"></span>
								<input id="ID" name="logname" class="text" style="color: #000000 !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input id="PASSWORD" name="logpass" class="text" style="color: #000000 !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>--%>
							<%--<div id="LOGIN" class="mb2"><a class="act-but submit" href="javascript:" onclick="login()" style="color: #FFFFFF">重新登录</a></div>--%>
							<div id="LOGIN23" class="mb2"><button id="testId" type="submit" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">请重新登录</button></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/TweenLite.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/EasePack.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/jquery.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/rAF.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/demo-1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/vendor/jgrowl/jquery.jgrowl.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/static/failLoginJsp/js/Longin.js"></script>
		<div style="text-align:center;">
</div>
</body>
</html>