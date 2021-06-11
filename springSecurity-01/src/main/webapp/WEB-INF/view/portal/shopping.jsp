<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta property="wb:webmaster" content="8eabb156d1a9cb46">
	<meta name="renderer" content="webkit"/>
 	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>必要平台-购物车 – 我要的，才是必要的 – 必要biyao.com</title>
    <link href="http://static.biyao.com/pc/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="http://static.biyao.com/pc/favicon.ico" rel="icon" type="image/x-icon" />	
	<link href="${pageContext.request.contextPath}/static/css/common.css?v=biyao_9cf87cc" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/static/css/cm_www.css?v=biyao_32104cf" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/static/css/newBuy.css?v=biyao_dac4785" rel="stylesheet"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.js?v=biyao_7d074dc"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.extention.js?v=biyao_98daa33"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js?v=biyao_a5283b2"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js?v=biyao_9a586f3"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/dialog.js?v=biyao_ba57fb5"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/select.js?v=biyao_1dcaa7c"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/loadmask.js?v=biyao_5aac5cc"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/commonre.js?v=biyao_27f335b"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js?v=biyao_a5283b2"></script>
	<script type="text/javascript">
		$(function()
		{
			//计算商品总价
			calculate();
			
			//删除购物车中商品
			$(".deleteBtn").click(function()
			{
				var productId = $(this).parent().parent().find("input[name='quantity']").prop("id");
				//发送请求
				$.ajax
				({
					url:"${pageContext.request.contextPath}/shoppingCart/deleteShopCartProductById",
					type:"post",
					data:{"productId":productId},
					beforeSend:function()
					{
						return true;
					},
					success:function(jsonObject)
					{
						if(jsonObject.success)
						{
							//操作成功
							location.replace(location.href);
						}
					}
				});
			});

			//退出按钮点击事件
			$("#exitBtn").click(function()
			{
				window.location.href = "${pageContext.request.contextPath}/boot/homePageExit";
			});

			//购物车
			$("#shopcarNumID").click(function()
			{
				window.location.href = "${pageContext.request.contextPath}/shoppingCart/showShoppingCart";
			});

		});
		
		//计算商品总价
		function calculate()
		{
			//商品总价
			var totalPrice = 0;
			//获取所有.subTotal的对象
			var subTotalElts = $(".subTotal");
			//循环遍历 计算 总价
			$.each(subTotalElts,function(i,n)
			{
				totalPrice += parseFloat($(n).text());
			});
			
			//将商品总价 赋值给id为totalPrice的标签
			$("#totalPrice").text(totalPrice);
		}
		
		//更新购物车中商品数量
		function updatePurchaseCount(productId,flag)
		{
			//更新之后的商品数量
			var updatePurchaseCount = 0;
			//获取该商品原有数量
			var oldCount = $("#"+productId).val();
			//判断用户是添加商品还是减少商品
			if("minus" == flag)
			{
				//如果是减：减至1时，不让再减少了
				if(oldCount == 1)
				{
					//alert("亲，不能再减少了！");
					return false;
				}
				else
				{
					//计算出更新之后的商品数量
					updatePurchaseCount = parseInt(oldCount) - 1;
				}
			}
			else
			{
				//如果是加
				//计算出更新之后的商品数量
				updatePurchaseCount = parseInt(oldCount) + 1;
			}			
			
			//发送请求更新商品数量
			$.ajax
			({
				url:"${pageContext.request.contextPath}/shoppingCart/updateShoppingCartProductPurchaseCount",
				type:"post",
				data:
				{
					"productId":productId,
					"updatePurchaseCount":updatePurchaseCount
				},
				beforeSend:function()
				{
					return true;
				},
				success:function(jsonObject)
				{
					if(jsonObject.success)
					{
						//更新成功 刷新当前页面
						location.replace(location.href);
					}
					else
					{
						alert("更新失败！");
					}
				}
			});
		}


	</script>

</head>
<body>



<!-- 新版首页 -->
	<div class="pub_nav">
  		<div class="wrap clearfix">
  			<div class="f_l">
			<ul>
				<li><a href="index.html" target="_blank">首页</a><b></b></li>
				<li><a href="about.html" id="supCenter">关于我们</a><b></b></li>
			
			</ul>
  			</div>
			<c:choose>
				<c:when test="${customer_session.phone != null}">
					<div class="f_r">
						<ul class="pub_nav_list sizeZero">
							<li class="inline">
								<a class="login" href="order.html">${customer_session.nickname}</a>
								<a class="regist mg_l10" href="javascript:void(0);" id="exitBtn">[ 退出 ]</a>
								<span class="bg"></span>
							</li>
							<li class="inline last ">
								<a href="javascript:void(0);" class="">个人中心<i class="inline pep_bg mg_l10"></i></a>
								<div class="app_box">
									<span class="inline upArre"></span>
									<div class="bg_fff down_list_box">
										<a class="inline" href="order.html">我的订单</a>
									</div>
								</div>
							</li>
							<li class="inline last pd_r0 shopping_cart vTop">
								<a class="inline sizeZero" href="javascript:void(0)">
									<i class="inline"></i>
									<span id="shopcarNumID" class="inline">购物车 <span>${shopping_count}</span></span>
								</a>
							</li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="f_r">
						<ul class="pub_nav_list sizeZero">
							<li class="inline">
								<%--<a class="login" href="order.html">Hi,此话当真</a>--%>
								<%--<a class="regist mg_l10" href="http://www.biyao.com/account/logout">[ 退出 ]</a>--%>
								<span class="bg"></span>
							</li>
							<li class="inline last ">
								<a href="javascript:void(0);" class="">个人中心<i class="inline pep_bg mg_l10"></i></a>
								<div class="app_box">
									<span class="inline upArre"></span>
									<div class="bg_fff down_list_box">
										<a class="inline" href="order.html">我的订单</a>
									</div>
								</div>
							</li>
							<li class="inline last pd_r0 shopping_cart vTop">
								<a class="inline sizeZero" href="javascript:void(0)">
									<i class="inline"></i>
									<span id="shopcarNumID" class="inline">购物车 <span>${shopping_count}</span></span>
								</a>
							</li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
  		</div>
  	</div>
  	<div class="bd_bottom_ea">
  		<div class="wrap pub_logo_box clearfix">
  			<div class="pub_logo"><a href="${pageContext.request.contextPath}/boot/loginLogo">
				<img alt="" src="${pageContext.request.contextPath}/static/images/logo.png?v=biyao_3251680"></a>
			</div>
  		</div>
  	</div>
</div><div class="wrap relative">
	<div class="shopStepBox">
		<div class="publicStepsbox">
			<div class="car_step_icon car_step1"></div>
			<ul class="clearfix car_step_txt">
				<li class="checked">查看购物车</li>
				<li>确认订单信息</li>
				<li>在线付款</li>
				<li>收货并评价</li>
			</ul>
		</div>
	</div>
</div>
<div class="pd_b40">
<div class="wrap ie78">
	<div class="lineH24 t_l  pd_t30 pd_b10 bd_b_d5c ">
		 <span class="f18 col_666 mg_l10 col_523">购物车</span>
	</div>
	<div class="comment_box">
		<table class="sop_table1" cellpadding="0" cellspacing="0">
			<tr>
				<th align="left" class="col_523">商品信息</th>
				<th width="10%" align="center" class="col_523">单价</th>
				<th width="10%" align="center" class="col_523">数量</th>
				<th width="20%" align="center" class="col_523">包装</th>
				<th width="10%" align="center" class="col_523">小计</th>
				<th width="5%" align="center" class="col_523">操作</th>
			</tr>
		</table>
	</div>
	<div class="shoppingBox ">

		<table class="sop_table1 lastTh tabledel bg_fff" cellpadding="0" cellspacing="0">
			<c:if test="${empty shoppingCartList}">
				<tr></tr>
			</c:if>
			<c:if test="${not empty shoppingCartList}">
				<c:forEach items="${shoppingCartList}" var="shoppingCartDetail">
					<tr>
						<!-- 商品图片 -->
						<td width="130" align="left">
						<span class="sop_img inline">
							<a target="_blank" href="javascript:;">
								<img width="100" height="100" src="static/${shoppingCartDetail.image1}" />
							</a>
						</span>
						</td>
						<!-- 商品标题 -->
						<td align="left">
							<a target="_blank" href="javascript:;">
								<span class="col_523">${shoppingCartDetail.title }</span>
							</a>
							<br />
							<div class="col_999 mg_t5 w300 escp"> 颜色:粉色</div>
							<!-- 无模型商品和低模普通商品签字 -->
							<!-- 普通高模商品签字 -->
						</td>
						<!-- 商品单价 -->
						<td width="10%" align="center" class="ff6600">¥${shoppingCartDetail.price}</td>
						<td width="10%" align="center" class="sizeZero">
							<i class="sign minus inline" onclick="updatePurchaseCount('${shoppingCartDetail.productId}','minus');"></i>
							<input name ="quantity" type="text" maxlength="3" name="input_7995296"
								   value="${shoppingCartDetail.purchaseCount}" shopcarid="7995296"
								   discount="0.0" price="699.0"
								   num="${shoppingCartDetail.purchaseCount}" packageprice="0.0"
								   modelid="0" supplierid="130091"
								   designid="1300915031060000001"
								   sizename="颜色:黑色"
								   class="inpCom w40 inline t_c"
								   readonly="readonly"
								   id="${shoppingCartDetail.productId}">
							<i class="sign plus inline" onclick="updatePurchaseCount('${shoppingCartDetail.productId}','plus');"></i>
							<p class="col_b76 mg_t5"></p>
						</td>
						<!-- 包装 -->
						<td width="20%" align="center" class="col_666">
							<span class="span_package_type">普通包装</span>
							<span class="span_package_price pack_selects">(免费)</span>
						</td>
						<!-- 商品小计 -->
						<td width="10%" align="center">
							<strong class="ff6600"><span>¥</span>
								<span class="subTotal">${shoppingCartDetail.purchaseCount * shoppingCartDetail.price}</span>
							</strong>
						</td>
						<td width="5%" align="center"><a href="javascript:;"  class="deleteBtn" data="7995296">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
	<div class="firmbox pd_t10 bg_fff tj_box">
		<div class="lineH30  pd_l10 pd_r10 clearfix ">
			<div class="f_r col_666 f14">商品总价：
				<span class=" col_f60 f14" >¥</span><span class="w80 inline col_f60 pd_r5 f14" id="totalPrice">0</span>
			</div>
			<span class="inline f_r mg_r30 col_666 f14">商品总数 <em class="col_f60  f14" id="totalNum">${shopping_count}</em> 件</span>
		</div>
		<div class="lineH30  pd_l10 pd_r10 clearfix ">
			<div class="f_r col_666 f14">
			</div>
		</div>	
	</div>
	<div class="tallyBox">
		<a href="${pageContext.request.contextPath}/boot/loginLogo" class="inline goonShopping ">继续购物</a>
		<a href="order/orderok" class=" tallyBTnPos inline span_submit_calre js_btn">结算</a>
	</div>
</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js?v=biyao_9a586f3"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/dialog.js?v=biyao_ba57fb5"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/select.js?v=biyao_1dcaa7c"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/autocomplete.js?v=biyao_bd4725d"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.pagination.js?v=biyao_1a0a135"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pages.js?v=biyao_5fd7a00"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/static/js/qrcode.js?v=biyao_8c0b79c"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/shopcarDes.js?v=biyao_ba3e6ae"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/static/js/lazyloadIM.js?v=biyao_c5ce53c"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/lazyload.js?v=biyao_80d4f78"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/materiallistDes.js?v=biyao_21283ab"></script>
<script type="text/template" id="materialsOfProductTemplate">
<div class="pop_bd pd_t15 clearfix">
	<ul class="sizeZero ml_list"></ul>
</div>
</script><div data-selector="J_im" id="webIM_showDiv"></div>
<div class="footer_links clearfix J_1200 auto">
    <div class="content wrap sizeZero">
    	<div class="footer_nav_box inline">
    		<ul class="footer_nav_list clearfix"> 
    			<li>
    				<a target="_blank" href="javascript:;">关于必要</a>
    				<span class="bg_line"></span>
    			</li>
    			<li>
    				<a target="_blank" href="javascript:;">加入必要</a>
    				<span class="bg_line"></span>
    			</li>
    			<li>
    				<a target="_blank" href="javascript:;">联系我们</a>
    				<span class="bg_line"></span>
    			</li>
    			<li class="none">
    				<a target="_blank" href="javascript:;">网站地图</a>
    			</li>
    			<li>
    				<a target="_blank" href="javascript:;">官方微博</a>
    				<span class="bg_line"></span>
    			</li>
    			
    		</ul>
    		<p class="col_999 lineH18 mg_t10">◎BIYAO.COM 2015 版权所有   			
			</p>
			<p class="col_999 lineH18 mg_t10"><i class="gwab_icon inline"></i><a class="col_999 inline mg_r5" href="javascript:;" target="_blank">粤公网安备44049102496139号</a> <a class="col_999 inline" href="javascript:;" target="_blank">粤ICP备13088531号</a>   			
			</p>
    	</div>   
    	<div class="footer_evm sizeZero inline">
    		<div class="inline mg_r40 footer_evm_img">
    			<div class="an_bg inline mg_r15"></div>
    			<div class="inline evm_tit_msg">
    				<span class="col_333 f14">扫描二维码下载</span><br/>
					<span class="col_724 f14">必要手机客户端</span>
    			</div>
    		</div>
    		<div class="inline mg_r10 footer_evm_img">
    			<div class="weixin_bg inline mg_r15"></div>
    			<div class="inline evm_tit_msg">
    				<span class="col_333 f14">扫描二维码关注</span><br/>
					<span class="col_724 f14">必要官方微信</span>
    			</div>
    		</div>
    	</div>
    </div>
</div><script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js?v=biyao_2bb680a"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bytrack.js"></script>
</body>

</html>