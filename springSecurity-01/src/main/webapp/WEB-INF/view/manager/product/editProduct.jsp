<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<link href="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/form/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function()
{
	$("#updateBtn").click(function()
	{
		$("#productForm").submit();
	});

	//不能使用ajaxForm提交
});

//商品编号验证
function checkProductNo()
{
	//商品编号不能为空，商品编号只能由数字字母和下划线组成，商品编号长度不能超过15位
	var productNo = $("#productno").val();
	//验证商品编号正则表达式
	var regExp = /^[A-Za-z0-9_-]*$/;
	if(productNo == "")
	{
		$("#checkProductNoMsg").text("商品编号不能为空");
	}
	else if(!regExp.test(productNo))
	{
		$("#checkProductNoMsg").text("商品编号只能由数字,字母和下划线组成");
	}
	else if(productNo.length > 15)
	{
		$("#checkProductNoMsg").text("商品编号长度不能超过15位");
	}
	else
	{
		$("#checkProductNoMsg").text("");
	}
}


//商品标题验证
function checkTitle()
{
	//商品标题不能为空，商品标题长度不能超过15
	var title = $("#title").val();
	if(title == "")
	{
		$("#checkTitleMsg").text("商品标题不能为空");
	}
	else if(title.length > 15)
	{
		$("#checkTitleMsg").text("商品标题长度不能超过15位");
	}
	else
	{
		$("#checkTitleMsg").text("");
	}
}


//商品单价验证
function checkPrice()
{
	//商品单价得是数字，商品单价>=0
	var price = $("#price").val();
	if(price == "")
	{
		$("#checkPriceMsg").text("商品单价不能为空");
	}
	else if(isNaN(price))
	{
		$("#checkPriceMsg").text("商品单价必须是数字");
	}
	else if(price < 0)
	{
		$("#checkPriceMsg").text("商品单价必须大于等于0");
	}
	else
	{
		$("#checkPriceMsg").text("");
	}
}


//验证图片上传控件
function checkImage()
{
	var photo = $("input[name='photos']");
	var regExp = /(.*).(jpg|bmp|gif|jpeg|png)$/;
	$.each(photo,function(i,n) //i是下标，n是当前dom对象
	{
		//判断控件是否为空：空代表：用户不修改图片
		if($(n).val() != "")
		{
			if(!regExp.test($(n).val()))
			{
				$("#checkImages").text("图片格式仅支持：jpg|bmp|gif|jpeg|png ！");
				return false;
			}
			else
			{
				$("#checkImages").text("");
			}
		}

	});
}


//onsubmit触发提交验证
function checkProductForm()
{
	//表单验证
	var flag = true;
	//触发每一个input的onblur()事件
	$("#productForm input[type='text']").blur();
	//触发图片验证
	checkImage();
	//获取每一个class的标签的内容，类选择器
	$.each($(".requireSpan"),function(i,n)
	{
		var spanText = $(n).text();
		if(spanText != "")
		{
			flag = false;
		}
	});
	return flag;
}

</script>
</head>
<body>

	<div style="position:  relative; left: 30px;">
		<h3>修改商品信息</h3>
	  	<div style="position: relative; top: -40px; left: 70%;">
			<button type="button" class="btn btn-primary" id="updateBtn">更新</button>
			<button type="button" class="btn btn-default" onclick="window.history.back(-1);">返回</button>
		</div>
		<hr style="position: relative; top: -40px;">
	</div>

	<form id="productForm" action="${pageContext.request.contextPath}/product/update" method="post" onsubmit="return checkProductForm();" enctype="multipart/form-data" class="form-horizontal" role="form" >
		<input type="hidden" name="id" value="${editProduct.id}"/>
		<div class="form-group">
			
			<label for="create-subject" class="col-sm-2 control-label">商品编号<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="productno" name="productno" onblur="checkProductNo();" value="${editProduct.productno}">
				<span id="checkProductNoMsg" class="requireSpan" style="color: red;"></span>
			</div>

			<label for="create-subject" class="col-sm-2 control-label">商品标题<span style="font-size: 15px; color: red;">*</span></label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="title" name="title" onblur="checkTitle();" value="${editProduct.title}">
				<span id="checkTitleMsg" class="requireSpan" style="color: red;"></span>
			</div>

		</div>

		<div class="form-group">
			<label for="create-expiryDate" class="col-sm-2 control-label">商品单价</label>
			<div class="col-sm-10" style="width: 300px;">
				<input type="text" class="form-control" id="price" name="price" onblur="checkPrice();" value="${editProduct.price}">
				<span id="checkPriceMsg" class="requireSpan" style="color: red;"></span>
			</div>

			<label for="create-priority" class="col-sm-2 control-label">商品状态</label>
			<div class="col-sm-10" style="width: 300px;">
				<select class="form-control" id="status" name="status">
				  <option value="0">发布</option>
				  <option value="1">未发布</option>
				  <option value="2">失效</option>
				</select>
				<script type="text/javascript">
					$("#status").val(${editProduct.status})
				</script>
			</div>

		</div>
		
		<div class="form-group">
			<label for="create-describe" class="col-sm-2 control-label">商品卖点</label>
			<div class="col-sm-10" style="width: 70%;">
				<textarea class="form-control" rows="3" id="create-describe" name="sellpoint">${editProduct.sellpoint}</textarea>
			</div>
		</div>
		
		<div style="position: relative; left: 40px; height: 30px; top: 60px;">
			<div style="position: relative;top: 20px; left: 50px;">
				请选择要上传的图片：<small style="color: gray;">[仅支持.jpg或.png格式]</small>
			</div>
			<div style="position: relative;top: 50px; left: 50px;">
				<input type="file" name="photos" onchange="checkImage();"/>
				<input type="hidden" id="image1" name="image1" value="${editProduct.image1}">
				<img src="${pageContext.request.contextPath}/static/${editProduct.image1}" style="width:600px;height:700px;"/><br>

				<input type="file" name="photos" onchange="checkImage();"/>
				<input type="hidden" id="image2" name="image2" value="${editProduct.image2}">
				<img src="${pageContext.request.contextPath}/static/${editProduct.image2}" style="width:600px;height:700px;"/><br>

				<input type="file" name="photos" onchange="checkImage();"/>
				<input type="hidden" id="image3" name="image3" value="${editProduct.image3}">
				<img src="${pageContext.request.contextPath}/static/${editProduct.image3}" style="width:600px;height:700px;"/><br>

				<input type="file" name="photos" onchange="checkImage();"/>
				<input type="hidden" id="image4" name="image4" value="${editProduct.image4}">
				<img src="${pageContext.request.contextPath}/static/${editProduct.image4}" style="width:600px;height:700px;"/><br>

				<input type="file" name="photos" onchange="checkImage();"/>
				<input type="hidden" id="image5" name="image5" value="${editProduct.image5}">
				<img src="${pageContext.request.contextPath}/static/${editProduct.image5}" style="width:600px;height:700px;"/><br>

				<span id="checkImages" class="requireSpan" style="color:red;"></span>
			</div>
		</div>
	</form>

</body>
</html>