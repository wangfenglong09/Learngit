<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

    <style type="text/css">
        #live2dcanvas
        {
            border: 0 !important;
        }
    </style>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <!-- 萌妹子图像 -->
    <script src="https://eqcn.ajz.miesnfu.com/wp-content/plugins/wp-3d-pony/live2dw/lib/L2Dwidget.min.js"></script>
    <script>
        L2Dwidget.init({
            "model": {
                "scale": 0.4
            },
            "display": {
                "position": "right",
                "width": 120,
                "height": 200,
                "hOffset": 0,
                "vOffset": 0
            },
            "mobile": {
                "show": true,
                "scale": 0.5
            },
            "react": {
                "opacityDefault": 1,
                "opacityOnHover": 1
            }
        });
    </script>

    <script>
        $(function()
        {
            //点击显示密码明文和隐藏
            window.onload=function()
            {
                var btn=document.getElementById("btn");
                var pass=document.getElementById("password");
                btn.onmousedown=function()
                {
                    pass.type="number"
                };
                btn.onmouseup=btn.onmouseout=function()
                {
                    pass.type="password"
                }
            }

            //因为type类型为submit了，所以直接提交了，不用在写按钮click方法了
            // 登录按钮点击事件
            /*$("#btnSubmit").click(function ()
            {
                var username = $("#username").val();
                var password = $("#password").val();
                $.ajax
                ({
                    url:"${pageContext.request.contextPath}/login/loginAjax",
                    type:"post",
                    data:{"username":username,"userpassword":password},
                    beforeSend:function()
                    {
                        return true;
                    },
                    success:function(jsonObject)
                    {
                        if(jsonObject.success)
                        {
                            $("#inputForm").submit();
                        }
                        else
                        {
                            alert(jsonObject.message);
                            //$("#checkPhoneMessage").text("输入的账号或密码不正确");
                            //alert("hah"+$("#checkPhoneMessage").text());
                        }
                    }
                });
            });*/

        });




    </script>

</head>
<body>
<div style="position: absolute; top: 0px; left: 0px; width: 65%; height: 100%;">
    <img src="${pageContext.request.contextPath}/static/image/IMG_7114.JPG" style="width: 90%; height: 92%; position: relative; top: 50px;">
</div>
<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
    <div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">springboot后台项目 &nbsp;<span style="font-size: 12px;">&copy;2021&nbsp;红领巾小胡子</span></div>
</div>

<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
    <div style="position: absolute; top: 0px; right: 60px;">
        <div class="page-header">
            <h1>登录</h1>
        </div>

        <form id="inputForm" action="${pageContext.request.contextPath}/toCheckUser" method="post" class="form-horizontal" role="form">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div class="form-group form-group-lg">
                <div style="width: 350px;">
                    <input type="text" id="username" name="username"  class="form-control"  placeholder="用户名" >
                </div>

                <div style="width: 350px; position: relative;top: 20px;">
                    <input type="password" id="password" name="password"  class="form-control"  placeholder="密码">
                    <input type="button" name="btn" id="btn" value="点击显示"/>
                </div>

                <div class="checkbox"  style="position: relative;top: 30px; left: 10px;">
                    <label>
                        <input type="checkbox" name="remember-me" value="true"> 十天内免登录
                    </label>
                </div>
                <%--<button id="btnSubmit" type="button" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>--%>
                <button id="testId" type="submit" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
