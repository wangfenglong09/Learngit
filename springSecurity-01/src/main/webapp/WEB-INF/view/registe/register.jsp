﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="description" content="必要C2M商城是全球性价比最高的电子商务平台，是全球第一家用户直连制造（Customer To Manufactory）的平台，通过平台建立消费者与品质制造商的桥梁，将消费者的需求直接发送到工厂，按需生产模式既满足了消费者个性化的需求，又短路了复杂的商品流通环节，真正让消费者享受到专属且高品质的商品。目前，商品覆盖高跟鞋、眼镜、饰品、运动鞋、运动服、女士包包等品类，未来会按照消费者需求来增加新的产品类目。"/>
	<meta name="Keywords" content="必要;必要商城;必要平台;必要电商;C2M商城;工业4.0;定制平台;定制商城;奢侈品定制;定制鞋;定制包;定制眼镜;定制饰品;定制运动服;定制运动鞋" />
	<meta property="qc:admins" content="35713343766211176375747716" />
	<meta name="renderer" content="webkit"/>
 	<meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
	<title>注册首页 – 我要的，才是必要的 – 必要biyao.com</title>
	<link href="${pageContext.request.contextPath}/static/picture/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<link href="${pageContext.request.contextPath}/static/picture/favicon.ico" rel="icon" type="image/x-icon" />

	<link type="text/css" href="${pageContext.request.contextPath}/static/css/common.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/static/css/cm_www.css" rel="stylesheet" />
	<link type="text/css" href="${pageContext.request.contextPath}/static/css/new.main.css" rel="stylesheet" />
	<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.js"></script>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/mastercommon.js"></script>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/static/js/jquery.extention.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/lazyload.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/form/jquery.form.js"></script>
	<script type="text/javascript">
		$(function()
        {
			$("#registerBtn").click(function()
            {
                var phone = $("#phone").val();
                if(phone == "请输入您的手机号码" || phone =="" || phone == null)
                {
                    alert("请填写手机号");
                    return false;
                }

				$("#customerForm").submit();
                // window.location.href = "$ {pageContext.request.contextPath}/product/verifyRegiste.do";
			});

            $("#customerForm").ajaxForm(
            {
                beforeSubmit:function()
                {

                    var flag = true;
                    //*****************************************************//
                    //进行用户手机号验证
                    $("#phone").blur(); //触发失去焦点事件  等待当前ajax执行完成之后才能往下继续执行(同步)
                    //获取span的内容
                    var checkPhoneMessage = $("#checkPhoneMessage").text();
                    //判断span内容是否为空 这是验证提示信息
                    if(checkPhoneMessage != "")
                    {
                        //不为空：验证不通过
                        flag = false;
                    }
                    //*****************************************************//

                    //*****************************************************//
                    //用户昵称验证
                    $("#verificationCode").blur();
                    var nickName = $("#checkNickNameMessage").text();
                    if(nickName !="")
                    {
                        flag = false;
                    }
                    //*****************************************************//

                    //为空：可以提交表单
                    return flag;
                },
                success:function(jsonObject)
                {
                    if(jsonObject.success)
                    {
                        window.location.href = jsonObject.returnURL;
                    }
                    else
                    {
                        alert(jsonObject.message);
                    }
                }
            });


            $("#phone").blur(function()
            {
                //获取用户输入的手机号
                var phone = $("#phone").val();
                //alert(phone);
                //发送请求查看该手机号是否在本系统已经注册过
                $.ajax(
                {
                    url:"${pageContext.request.contextPath}/boot/checkPhone",
					type:"post",
					async:"false", //async是同步异步标志，false的时候表示是同步，必须等待当前ajax执行完成
					data:{"phone":phone},
					beforeSend:function()
                    {
						return true;
					},
					success:function(jsonObject)
                    {
						if(jsonObject.success)
						{
							//成功：该手机号已注册	
							$("#checkPhoneMessage").text("该手机号已注册，请更换手机号码！");
						}
						else
						{
							$("#checkPhoneMessage").text("");
						}
					}
				});
			});


            $("#verificationCode").blur(function()
            {
                var nickName = $("#verificationCode").val();
                if(nickName=="请输入昵称" || nickName=="" ||nickName==null)
                {
                    $("#checkNickNameMessage").text("请填写用户昵称");
                }
                else
                {
                    $("#checkNickNameMessage").text("");
                }
            });

		});
	</script>

</head>
<body id="pagebody">
	 <script type="text/javascript">

$(function(){
		var passwordRegex = /.*\s+.*/;
 	 	$(".loginTxt").focus(function(){
			  if ($(this).val() == $(this)[0].defaultValue) {
				    $(this).val("");
			  }
			
		});

 	 	$("#passwd_show").focus(function(){
 	 		$(this).addClass("none");
 	 		$("#passwd1").val("").removeClass("none").focus();
 	 		$("#error1").html("<i class=\"tip_erorr inline\"></i>");
 	 	});

 	 	$("#passwd1").blur(function(){
 	 		if($("#passwd1").val()==""){
 	 			$("#passwd_show").removeClass("none");
 	 			$(this).addClass("none")
 	 		}
 	 		if (passwordRegex.test($('#passwd1').val())) {
	 	 		$("#passwd_show").removeClass("none");
	 	 		$("#passwd1").val("");
	 	 		$(this).addClass("none")
	 	 		$("#error1").html("<i class=\"tip_erorr inline\"></i>密码中不可包含空格");
	 	 	}
 	 	});

 	 	$("#passwd_show2").focus(function(){
 	 		$(this).addClass("none");
 	 		$("#passwd2").removeClass("none").focus();
 	 		$("#error2").html("<i class=\"tip_erorr inline\"></i>");
 	 	});

 	 	$("#passwd2").blur(function(){
 	 		if($("#passwd2").val()==""){
 	 			$("#passwd_show2").removeClass("none");
 	 			$(this).addClass("none")
 	 		}
 	 		if (passwordRegex.test($('#passwd2').val())) {
		    	$("#passwd_show2").removeClass("none");
		    	$("#passwd2").val("");
 				$(this).addClass("none");
 				$("#error2").html("<i class=\"tip_erorr inline\"></i>密码中不可包含空格");
		 	}
 	 		
 	 	});
		$(".loginTxt").blur(function(){
			  if ($.trim($(this).val()) == "") {
				    $(this).val($(this)[0].defaultValue);
				   }
		});
});
$(document).ready(function(){
	var source = $.cookie("source");
	$("#sourceID").attr("value",source);
});
</script>

<html>
<head>
</head>
<body>
<div class="bd_bottom_ea">
	<div class="wrap pub_logo_box clearfix">
		<div class="pub_logo f_l"><a href="${pageContext.request.contextPath}/boot/loginLogo"><img alt="" src="${pageContext.request.contextPath}/static/picture/logo.png"></a></div>
		<div class="f_r">
			<ul class="sizeZero merchant_info_box">
				<li class="inline mg_l40 mg_t40">
					<span class="inline col_8c8">欢迎来到这个世界，请 </span>

                    <%--登录按钮--%>
                    <a class="col_8c8 inline mg_l5" href="${pageContext.request.contextPath}/boot/login">登录 </a>

                    <span class="col_8c8 mg_l5 mg_r5 inline">|</span><span class="col_8c8 inline">注册</span>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="wrap">
<div class="loginItem auto ">
	<form id="customerForm" action="${pageContext.request.contextPath}/boot/verifyRegiste" method="post" >
	<input type="hidden"  id="returnURL" name="returnURL" value="${returnURL}"/><!--returnURL随着表单提交到后台，后台String接收-->
	<div class="loginBox">
		<div class="inline loginTitBox"><i class="inline loginListBg spIcon mg_r10"></i><span class="inline">新用户注册</span></div>
		<dl class="mg_t20">
			<dd class="inline mg_r5">
				<input  type="text" value="请输入您的手机号码" class="loginTxt w360 col_999 border" id="phone" name="phone" data-type="mobile-number" maxlength="11"  />
				<input type="hidden" value="" name="source" id="sourceID"/>
				<span id="checkPhoneMessage" style="color:red;"></span>
			</dd>
	        <dd class="J_validate inline col_f90"></dd>
		</dl>
		<dl class="mg_t20 sizeZero none" id="imgCodeDiv">
	   		<dd class="inline mg_r20">
                <input tip='请填写右侧的验证码' type="text" id="registImgCode" class="loginTxt w160 col_999" maxlength="4"/>
            </dd>
	   		<dd class="inline mg_r20">
                <img src="${pageContext.request.contextPath}/static/picture/grey.gif" height="45" width="120" id="registImg" />
            </dd>
	   		<dd class="inline mg_r15">
                <a href="javascript:;" id="imgChange" class="col_999 unLine">看不清<br/>换一张</a>
            </dd>
	       	<dd class="inline col_f90 J_validate" id="error_img"></dd>
	   	</dl>
	    <dl class="mg_t20">
			<dd class="inline mg_r5">
                <%--<input type="text"  value="请输入短信验证码"  name="securitycode" id="verificationCode"  class="loginTxt w200 col_999  border" />--%>
	       		<%--<input type="button" value="获取验证码1" class="setCodeBtn" id="getVerificationCode" style="margin-left: 17px;" />--%>
                <input type="text"  value="请输入昵称"  name="securitycode" id="verificationCode"  class="loginTxt w200 col_999  border" />
                <input type="button" value="昵称" class="setCodeBtn" id="getVerificationCode" style="margin-left: 17px;" />
	  			<span class="inline mg_l5" id="desc" style="display: none"></span>
	    		<span id="prompt" class="none"></span>
                    <span id="checkNickNameMessage" style="color:red;"></span>
	      	</dd>
	       	<dd class="J_validate inline col_f90"></dd>
		</dl>
		<dl class="mg_t20 none voiceCheck">
			<dd  ><span class="inline col_999 ">没有收到短信？点击&nbsp;</span><span class="inline col_link voiceCheckLink" style=" cursor: pointer;">获取语言验证码</span></dd>
		</dl>
	   	<dl class="mg_t20">
			<dd class="inline mg_r5">
				<input type="password" id="passwd1" name="password" class="loginTxt w360 col_999 border none"  />
				<input id="passwd_show" type="text" value="请输入您要设置的密码"  class=" loginTxt  w360 col_999 border"/>
			</dd>
			<dd class="inline col_f90 J_validate" id="error1"></dd>
		</dl>
	   	<dl class="mg_t20">
		<!-- <dt class="inline">确认密码：</dt> -->
		<dd class="inline mg_r5">
			<input type="password" id="passwd2"  value="" name="confirmPassword" id=""  class="loginTxt w360 col_999 border none" />
			<input id="passwd_show2" type="text" value="请确认密码"  class=" loginTxt  w360 border col_999"/>
		</dd>
	  	<dd class="inline col_f90 J_validate" id="error2"></dd>
		</dl>
	   	<dl class="mg_t20">
	     <!--   <dt class="inline">&nbsp</dt> -->
	       <dd class="inline">
	       	<label class="inline col_666 mg_r10 checked" id="ckfw">
                <i class="openIcon inline mg_r10"></i>
                <span name="consent-agreement" class="inline col_8a8a8a">我已阅读并同意</span>
            </label>
	           <a href="http://static3.biyao.com/pc/www/html/xieyi.html" target="_blank" class="inline col_link mg_r10"  id="linkServiceAgreement">《必要服务协议》</a><span class="isxt"></span> 
	       </dd>
	   	</dl>
        <!-- 注册按钮 -->
	   	<input type="button" id="registerBtn" class="loginBtn w400 inline t_c mg_t20" value="注册"/>

	   	<input type="button" class="loginBtns w240 inline t_c mg_t20 none" value="注册"/>

	   	<div class="pop_mark" style="display:none"></div>
		<div class="pop pd_b30" style="width:600px;top:90px;left:50%;margin-left:-300px; display: none;">
			<div class="pop_hd"><span class="pop_close"></span> 必要服务协议</div>
			<div class=" eidter_list_con backg_fff posR pd_lr25 mg_t20 overflow">
			<div class="parts_box posR">
			 <div class="serviceAgreement posR none">
                                    <p>欢迎您使用必要平台服务！</p>
                                    <h3>特别提示：</h3>
                                    <p>在使用必要平台服务之前，您应当认真阅读并遵守《必要服务协议》（以下简称“本协议”），请您务必审慎阅读、充分理解各条款内容，特别是免除 或者限制责任的条款、争议解决和法律适用条款。免除或者限制责任的条款可能将以加粗字体显示，您应重点阅读。如您对协议有任何疑问的，应向必要客服咨询。</p>
                                    <p>当您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，或您按照激活页面提示填写信息、阅读并同意本协议且完成全部激活程序后，或您以其他必要允许的方式实际使用必要平台服务时，即表示您已充分阅读、理解并接受本协议的全部内容，并与必要平台达成协议。您承诺接受并遵守本协议的约定， 届时您不应以未阅读本协议的内容或者未获得必要对您问询的解答等理由，主张本协议无效，或要求撤销本协议。</p>
                                    <h3>一、 协议范围</h3>
                                    <p>1、本协议由您与必要平台的经营者（以下简称“必要”）共同缔结，本协议具有合同效力。</p>
                                    <p>必要平台的经营者是指法律认可的经营必要平台网站的责任主体。有关必要平台经营者的信息请查看必要平台首页底部公布的公司信息和证照信息。</p>
                                    <p>2、除另行明确声明外，必要平台服务包含任何必要及其关联公司提供的基于互联网以及移动网的相关服务，且均受本协议约束。如果您不同意本协议的约定，您应立即停止注册/激活程序或停止使用必要平台服务。</p>
                                    <p>3、本协议内容包括协议正文及所有必要已经发布或将来可能发布的各类规则、公告或通知（以下合称“必要规则”或“规则”）。所有规则为本协议不可分割的组成部分，与协议正文具有同等法律效力。</p>
                                    <p>4、必要有权根据需要不时地制订、修改本协议及/或各类规则，并以网站公示的方式进行变更公告，无需另行单独通知您。变更后的协议和规则一经在网站公布后，立即或在公告明确的特定时间自动生效。若您不同意相关变更，应当立即停止使用必要平台服务。若您在前述变更公告后继续使用必要平台服务的，即表示您已经阅读、理解并接受经修订的协议和规则。</p>
                                    <h3>二、 注册与账户</h3>
                                    <p>1、主体资格</p>
                                    <p>您确认，在您完成注册程序或以其他必要允许的方式实际使用必要平台服务时，您应当是具备完全民事行为能权利能力和完全民事力的自然人、法人或其他组织。若您不具备前述主体资格，则您及您的监护人应承担因此而导致的一切后果，且必要有权注销或永久冻结您的账户，并向您及您的监护人索偿相应损失。</p>
                                    <p>2、注册和账户</p>
                                    <p>a）当您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后，或在您按照激活页面提示填写信息、阅读并同意本协议且完成全部激活程序后，或您以其他必要允许的方式实际使用必要平台服务时，您即受本协议约束。您可以使用您提供或确认的手机号码作为登录方式进入必要平台。</p>
                                    <p>b）您可以对账户设置必要昵称，您设置的必要昵称不得侵犯或涉嫌侵犯他人合法权益。如您设置的必要昵称涉嫌侵犯他人合法权益，必要有权终止向您提供必要平台服务，注销您的必要昵称。</p>
                                    <p>c）您的登录名、必要昵称和密码不得以任何方式买卖、转让、赠与或继承，除非有法律明确规定或司法裁定，并经必要同意，且需提供必要要求的合格的文件材料并根据必要制定的操作流程办理。</p>
                                    <p>3、用户信息</p>
                                    <p>a）在注册或激活流程时，您应当依照法律法规要求，按相应页面的提示准确提供您的资料，并于资料信息变更时及时更新，以保证您所提交资料的真实、及时、完整和准确。如必要根据自身独立判断认为您提供的资料存在错误、不实、过时或不完整的风险时，必要有权向您发出询问及/或要求改正的通知，并有权直接做出删除相应资料的处理，直至中止、终止对您提供部分或全部必要平台服务。必要对此不承担任何责任，您将承担因此产生的任何直接或间接损失及不利后果。</p>
                                    <p>b）您应当准确填写并及时更新您提供的电子邮件地址、联系电话、联系地址、邮政编码等联系方式，以便必要或其他用户与您进行有效联系，因通过这些联系方式无法与您取得联系，导致您在使用必要平台服务过程中产生任何损失或增加费用的，应由您完全独自承担。您了解并同意，您有义务保持你提供的联系 方式的真实性和有效性，如有变更或需要更新的，您应按必要的要求进行操作。</p>
                                    <p>4、账户安全</p>
                                    <p>您须自行负责对您的必要昵称、密码、安全手机保密，且须对您在该登录名、必要昵称和密码下发生的所有活动（包括但不限于信息披露、发布信息、网 上点击同意或提交各类规则协议、网上续签协议或购买服务等）承担责任。您同意：</p>
                                    <p>(a) 如发现任何人未经授权使用您的登录名、必要昵称和密码，或发生违反保密规定的任何其他情况，您会立即通知必要平台客服管理人员，并授权必要平台客服管理人员将该账号冻结；</p>
                                    <p>(b) 确保您在每个上网时段结束时，以正确步骤离开网站/服务。必要不能也不会对因您未能遵守本款规定而发生的任何损失负责。您理解必要对您的请求采取行动需要合理时间，必要对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。</p>
                                    <p>c）您因为手机丢失导致的经济等损失，必要平台不承担责任。</p>
                                    <h3>三、 必要平台服务</h3>
                                    <p>1、通过必要及其关联公司提供的必要平台服务和其它服务，用户可在必要平台上查询商品和发送服务信息、达成交易意向并进行交易、对其他用户进行评价、参加必要组织的活动以及使用其它信息服务及技术服务，具体以所开通的平台提供的服务内容为准。</p>
                                    <p>2、您在必要平台上交易过程中与其他用户发生交易纠纷时，一旦您或其它用户任一方或双方共同提交必要要求调处，则必要作为独立第三方，有权根据单方判断做出调处决定，您了解并同意接受必要的判断和调处决定。</p>
                                    <p>3、您了解并同意，必要有权应政府部门（包括司法及行政部门）的要求，向其提供您向必要提供的用户信息和交易记录等必要信息。如您涉嫌侵犯他人知识产权等合法权益，则必要亦有权在初步判断涉嫌侵权行为存在的情况下，向权利人提供您必要的身份信息。</p>
                                    <p>4、您在使用必要平台服务过程中，所产生的应纳税赋，以及一切硬件、软件、服务及其它方面的费用，均由您独自承担。</p>
                                    <h3>四、必要平台服务使用规范</h3>
                                    <p>1、在必要平台上使用必要服务过程中，您承诺遵守以下约定：</p>
                                    <p>a)实施的所有行为均遵守国家法律、法规等规范性文件及必要平台各项规则的规定和要求，不违背社会公共利益或公共道德，不损害他人的合法权益，不偷逃应缴税费，不违反本协议及相关规则。</p>
                                    <p>b)在与其他用户交易过程中，遵守诚实信用原则，不采取不正当竞争行为，不扰乱网上交易的正常秩序，不从事与网上交易无关的行为。</p>
                                    <p>c)不发布国家禁止销售的或限制销售的商品或服务信息（除非取得合法且足够的许可），不发布涉嫌侵犯他人知识产权或其它合法权益的商品或服务信息， 不发布违背社会公共利益或公共道德或必要认为不适合在必要平台上销售的商品或服务信息，不发布其它涉嫌违法或违反本协议及各类规则的信息。</p>
                                    <p>d)不以包括但不限于虚构或歪曲事实等可能侵害其他用户合法权益的方式不当评价其他用户，不采取不正当方式制造或提高自身的信用度，不采取不正当方式制造或提高（降低）其他用户的信用度。</p>
                                    <p>e)不对必要平台上的任何数据作商业性利用，包括但不限于在未经必要事先书面同意的情况下，以复制、传播等任何方式使用必要平台站上展示的资料。</p>
                                    <p>f)不使用任何装置、软件或例行程序干预或试图干预必要平台的正常运作或正在必要平台上进行的任何交易、活动。您不得采取任何将导致不合理的庞大数据负载加诸必要平台网络设备的行动。</p>
                                    <p>2、您了解并同意：</p>
                                    <p>a)您如果违反本协议项下规定，产生任何法律后果的，您应以自己的名义独立承担所有的法律责任，并确保必要免于因此产生任何损失或增加费用。</p>
                                    <p>b)基于维护必要平台交易秩序及交易安全的需要，必要有权根据自身独立判断在认为存在发生恶意购买等扰乱市场正常交易秩序风险的情形下，执行关闭相应交易订单等操作。</p>
                                    <p>c)经国家行政或司法机关的生效法律文书确认您存在违法或侵权行为，或者必要根据自身的判断，认为您的行为涉嫌违反法律法规的规定或涉嫌违反本协议和/或规则的条款的，则必要有权在必要平台上公示您的该等涉嫌违法或违约行为及必要已对您采取的措施。</p>
                                    <p>d)对于您在必要平台上发布的涉嫌违法、涉嫌侵犯他人合法权利或违反本协议和/或规则的信息，必要有权不经通知您即予以删除，且按照规则的规定进行处罚。</p>
                                    <p>e)对于您违反本协议项下承诺，或您在必要平台上实施的行为，包括您未在必要平台上实施但已经对必要平台及其用户产生影响的行为，必要有权根据自身独立判断认定您行为的性质及是否构成对本协议和/或规则的违反，并根据单方认定结果适用规则予以处理或终止向您提供服务，且无须征得您的同意或提前通知予您。您 应自行保存与您行为有关的全部证据，并应对无法提供充要证据而承担的不利后果。</p>
                                    <p>f)如您涉嫌违反有关法律或者本协议之规定，使必要遭受任何损失，或受到任何第三方的索赔，或受到任何行政管理部门的处罚，您应当赔偿必要因此造成的损失和/或发生的费用，包括合理的律师费用。</p>
                                    <h3>五、特别授权</h3>
                                    <p>您完全理解并不可撤销地授予必要及其关联公司下列权利：</p>
                                    <p>1、您完全理解并不可撤销地授权必要或必要授权的第三方或您与必要一致同意的第三方，根据本协议及必要规则的规定，处理您在必要平台上发生的 所有交易及可能产生的交易纠纷。您同意接受必要或必要授权的第三方或您与必要一致同意的第三方的判断和调处决定。该决定将对您具有法律约束力。</p>
                                    <p>2、一旦您向必要和/或其关联公司，作出任何形式的承诺，且相关公司已确认您违反了该承诺，则必要有权立即按您的承诺或协议约定的方式对您的账户采取限制措施，包括中止或终止向您提供服务，并公示相关公司确认的您的违约情况。您了解并同意，必要无须就相关确认与您核对事实，或另行征得您的同意，且必要无须就此限制措施或公示行为向您承担任何的责任。</p>
                                    <p>3、一旦您违反本协议，或与必要签订的其他协议的约定，必要有权以任何方式通知必要关联公司要求其对您的权益采取限制措施，要求必要与关联公司中止、终止对您提供部分或全部服务，且在其经营或实际控制的任何网站公示您的违约情况。</p>
                                    <h3>六、责任范围和责任限制</h3>
                                    <p>1、必要负责按"现状"和"可得到"的状态向您提供必要平台服务。但必要对必要平台服务不作任何明示或暗示的保证，包括但不限于必要平台服务 的适用性、没有错误或疏漏、持续性、准确性、可靠性、适用于某一特定用途。同时，必要也不对必要平台服务所涉及的技术及信息的有效性、准确性、正确性、可 靠性、质量、稳定、完整和及时性做出任何承诺和保证。</p>
                                    <p>2、您了解必要平台上的信息系用户自行发布，且可能存在风险和瑕疵。必要平台仅作为交易平台，并非产品服务的实际提供方，亦非信息的发布方。必要平台仅作为您获取物品或服务信息、物色交易 对象、就物品和/或服务的交易进行协商及开展交易的场所，但必要无法控制交易所涉及的物品的质量、安全或合法性，商贸信息的真实性或准确性，以及交易各方 履行其在贸易协议中各项义务的能力。您应自行谨慎判断确定相关物品及/或信息的真实性、合法性和有效性，并自行承担因此产生的责任与损失。</p>
                                    <p>3、除非法律法规明确要求，或出现以下情况，否则，必要没有义务对所有用户的信息数据、商品和服务信息、交易行为以及与交易有关的其它事项进行事先审查：</p>
                                    <p>a)必要有合理的理由认为特定用户及具体交易事项可能存在重大违法或违约情形。</p>
                                    <p>b)必要有合理的理由认为用户在必要平台的行为涉嫌违法或不当。</p>
                                    <p>4、必要或必要授权的第三方或您与必要一致同意的第三方有权基于您不可撤销的授权受理您与其他用户因交易产生的争议，并有权单方判断与该争议 相关的事实及应适用的规则，进而作出处理决定，包括但不限于调整相关订单的交易状态。该处理决定对您有约束力。如您未在限期内执行处理决定的，则必要有权利（但无义务）直接使用您必要账户内的款项，或您向必要及其关联公司交纳的保证金代为支付。您应在3日内补足保证金并弥补必要及其关联公司的损失，否则必要及其关联公司有权直接抵减您在其它合同项下的权益，并有权继续追偿。</p>
                                    <p>您理解并同意，必要或必要授权的第三方或您与必要一致同意的第三方并非司法机构，仅能以普通人的身份对证据进行鉴别，必要或必要授权的第三方或您与 必要一致同意的第三方对争议的调处完全是基于您不可撤销的授权，其无法保证争议处理结果符合您的期望，也不对争议调处结论承担任何责任。如您因此遭受损失，您同意自行向受益人索偿。</p>
                                    <p>5、您了解并同意，必要不对因下述任一情况而导致您的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其它无形损失的损害赔偿 (无论必要是否已被告知该等损害赔偿的可能性) ：</p>
                                    <p>a)使用或未能使用必要平台服务。</p>
                                    <p>b)第三方未经批准的使用您的账户或更改您的数据。</p>
                                    <p>c)通过必要平台服务购买或获取任何商品、样品、数据、信息或进行交易等行为或替代行为产生的费用及损失。</p>
                                    <p>d)您对必要平台服务的误解。</p>
                                    <p>e)任何非因必要的原因而引起的与必要平台服务有关的其它损失。</p>
                                    <p>6、不论在何种情况下，必要均不对由于信息网络正常的设备维护，信息网络连接故障，电脑、通讯或其他系统的故障，电力故障，罢工，劳动争议， 暴乱，起义，骚乱，生产力或生产资料不足，火灾，洪水，风暴，爆炸，战争，政府行为，司法行政机关的命令或第三方的不作为而造成的不能服务或延迟服务承担 责任。</p>
                                    <h3>七、协议终止</h3>
                                    <p>1、您同意，必要有权自行全权决定以任何理由不经事先通知的中止、终止向您提供部分或全部必要平台服务，暂时冻结或永久冻结（注销）您的账户在必要平台的权限，且无须为此向您或任何第三方承担任何责任。</p>
                                    <p>2、出现以下情况时，必要有权直接以注销账户的方式终止本协议，并有权永久冻结您的账户在必要平台的权限和收回账户对应的必要昵称。</p>
                                    <p>a)必要终止向您提供服务后，您涉嫌再一次直接或间接以他人名义注册为必要用户的；</p>
                                    <p>b)您提供的电子邮箱不存在或无法接收电子邮件，且没有其他方式可以与您进行联系，或必要以其它联系方式通知您更改电子邮件信息，而您在必要通知后三个工作日内仍未更改为有效的电子邮箱的。</p>
                                    <p>c)您提供的用户信息中的主要内容不真实或不准确或不及时或不完整；</p>
                                    <p>d)本协议（含规则）变更时，您明示并以书面形式通知必要不愿接受新的服务协议的；</p>
                                    <p>e)其它必要认为应当终止服务的情况。</p>
                                    <p>3、您的账户服务被终止或者账户在必要平台的权限被永久冻结（注销）后，必要没有义务为您保留或向您披露您账户中的任何信息，也没有义务向您或第三方转发任何您未曾阅读或发送过的信息。</p>
                                    <p>4、您同意，您与必要的合同关系终止后，必要仍享有下列权利：</p>
                                    <p>a）继续保存您的用户信息及您使用必要平台服务期间的所有交易信息。</p>
                                    <p>b)您在使用必要平台服务期间存在违法行为或违反本协议和/或规则的行为的，必要仍可依据本协议向您主张权利。</p>
                                    <p>5、必要中止或终止向您提供必要平台服务后，对于您在服务中止或终止之前的交易行为依下列原则处理，您应独力处理并完全承担进行以下处理所产生的任何争议、损失或增加的任何费用，并应确保必要免于因此产生任何损失或承担任何费用：</p>
                                    <p>a)您在服务中止或终止之前已经上传至必要平台的商品或服务尚未交易的，必要有权在中止或终止服务的同时删除此项商品或服务的相关信息；</p>
                                    <p>b)您在服务中止或终止之前已经与其他用户达成买卖合同，但合同尚未实际履行的，必要有权删除该买卖合同及其交易商品或服务的相关信息；</p>
                                    <p>c)您在服务中止或终止之前已经与其他用户达成买卖合同且已部分履行的，必要可以不删除该项交易，但必要有权在中止或终止服务的同时将相关情形通知您的交易对方。</p>
                                    <h3>八、法律适用、管辖与其他</h3>
                                    <p>1、本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国大陆地区法律，如无相关法律规定的，则应参照通用国际商业惯例和/或行业惯例。</p>
                                    <p>2、本协议包含了您使用必要平台需遵守的一般性规范，您在使用必要平台时还需遵守适用于该平台的特殊性规范（具体请参见您与该平台签署的其他协议以及平台规则等内容）。一般性规范如与特殊性规范不一致或有冲突，则特殊性规范具有优先效力。</p>
                                    <p>3、因本协议产生之争议需根据您使用的服务归属的平台确定具体的争议对象，例如因您使用必要服务所产生的争议应由必要的经营者与您沟通并处理。一旦产生争议，您与必要平台的经营者均同意将争议提交至北京仲裁委员会通过仲裁方式解决。</p>
                                </div>
			</div>
			</div><!--content1 end-->
		    <div class="t_c mg_t20">
		     	<a href="javascript:void(0);" class="confirm_btn">同意协议并继续</a>
		    </div>
		</div>   
	</div>
	</form>
</div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/js/validate.js"></script>
<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
<script src="${pageContext.request.contextPath}/static/js/md5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/dialog.js"></script>
<script src="${pageContext.request.contextPath}/static/js/registnew.js"></script>
<script src="${pageContext.request.contextPath}/static/js/regval.js"></script>
<!-- 底部栏 -->
<div class="footer">
    <div class="footer-info">
        <ul>
            <li><a target="_blank" href="http://www.biyao.com/minisite/ljby">关于必要</a></li>
            <li><a target="_blank" href="http://www.biyao.com/help/8.html">加入必要</a></li>
            <li><a target="_blank" href="http://www.biyao.com/help/tel.html">联系我们</a></li>
            <li><a target="_blank" href="http://weibo.com/biyaoshangcheng">官方微博</a></li>
        </ul>
        <span>◎BIYAO.COM 2015 版权所有</span>
        <p>
            <i></i>
            <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44049102496139" target="_blank">粤公网安备44049102496139号</a>
            <a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">粤ICP备13088531号</a>
        </p>
    </div>
    <ul class="footer-code">
        <li>
            <span class="code-down"></span>
            <dl>
                <dt>扫描二维码下载</dt>
                <dd>必要手机客户端</dd>
            </dl>
        </li>
        <li>
            <span class="code-active"></span>
            <dl>
                <dt>扫描二维码关注</dt>
                <dd>必要官方微信</dd>
            </dl>
        </li>
    </ul>
</div>
<script src="${pageContext.request.contextPath}/static/js/common.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/static/js/common.js" type="text/javascript"></script>
	</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bytrack.js"></script>
<script>
// GA跟踪代码20150826
 var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8263bc34c44278c176458d5aca724aed";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script> 
</html>