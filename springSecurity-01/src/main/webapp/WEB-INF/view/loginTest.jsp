<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

    <%--<style type="text/css">
        #live2dcanvas
        {
            border: 0 !important;
        }
    </style>--%>

    <style>
        html,
        body {
            background: #333333;
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #EFEFEF;
        }

        #fireworks {
            position: fixed;
            top: 0px;
            z-index: 9999;
        }
    </style>

    <script type="text/javascript" charset="utf-8"  src="https://files.cnblogs.com/files/liuzhou1/L2Dwidget.0.min.js"></script>
    <script type="text/javascript" charset="utf-8"  src="https://files.cnblogs.com/files/liuzhou1/L2Dwidget.min.js"></script>

    <script>
        $(function() {
            //点击显示密码明文和隐藏
            window.onload = function () {
                var btn = document.getElementById("btn");
                var pass = document.getElementById("password");
                btn.onmousedown = function () {
                    pass.type = "number"
                };
                btn.onmouseup = btn.onmouseout = function () {
                    pass.type = "password"
                }
            }
        });
    </script>
</head>

<body>
    <div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
        <div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">springboot后台项目 &nbsp;<span style="font-size: 12px;">&copy;2019&nbsp;红领巾小胡子</span></div>
    </div>

<div id="fireworks"></div>
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
<!-- 点击出富强民主效果 -->
<script>
    /* --   Beautiful Mouse  -- */
    var a_idx = 0;
    jQuery(document).ready(function ($) {
        $("body").click(function (e) {
            var a = new Array("❤富强❤", "❤民主❤", "❤和谐❤", "❤文明❤", "❤自由❤", "❤平等❤", "❤公正❤", "❤法治❤",
                "❤爱国❤", "❤敬业❤", "❤诚信❤", "❤友善❤");
            var $i = $("<span></span>").text(a[a_idx]);
            a_idx = (a_idx + 1) % a.length;
            var x = e.pageX,
                y = e.pageY;
            $i.css({
                "z-index": 999999999999999999999999999999999999999999999999999999999999999999999,
                "top": y - 20,
                "left": x,
                "position": "absolute",
                "font-weight": "bold",
                "color": "rgb(" + Math.floor(Math.random() * 255) + "," + Math.floor(Math
                    .random() * 255) + "," + Math.floor(Math.random() * 255) + ")"
            });
            $("body").append($i);
            $i.animate({
                    "top": y - 180,
                    "opacity": 0
                },
                1500,
                function () {
                    $i.remove();
                });
        });
    });
</script>
<!-- 鼠标滑动出气泡效果 -->
<script src="https://cdn.bootcss.com/sketch.js/1.1/sketch.min.js"></script>
<script>
    function Particle(x, y, radius) {
        this.init(x, y, radius);
    }

    Particle.prototype = {
        init: function (x, y, radius) {
            this.alive = true;
            this.radius = radius || 10;
            this.wander = 0.15;
            this.theta = random(TWO_PI);
            this.drag = 0.92;
            this.color = '#fff';
            this.x = x || 0.0;
            this.y = y || 0.0;
            this.vx = 0.0;
            this.vy = 0.0;
        },
        move: function () {
            this.x += this.vx;
            this.y += this.vy;
            this.vx *= this.drag;
            this.vy *= this.drag;
            this.theta += random(-0.5, 0.5) * this.wander;
            this.vx += sin(this.theta) * 0.1;
            this.vy += cos(this.theta) * 0.1;
            this.radius *= 0.96;
            this.alive = this.radius > 0.5;
        },
        draw: function (ctx) {
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.radius, 0, TWO_PI);
            ctx.fillStyle = this.color;
            ctx.fill();
        }
    };
    let MAX_PARTICLES = 280;
    let COLOURS = ['#69D2E7', '#A7DBD8', '#E0E4CC', '#F38630', '#FA6900',
        '#FF4E50', '#F9D423'];
    let particles = [];
    let pool = [];
    let demo = Sketch.create({
        container: document.getElementById('fireworks')
    });
    demo.spawn = function (x, y) {
        if (particles.length >= MAX_PARTICLES)
            pool.push(particles.shift());
        particle = pool.length ? pool.pop() : new Particle();
        particle.init(x, y, random(5, 10)); //出气泡的大小在5px 到 10px之间
        particle.wander = random(0.5, 2.0);
        particle.color = random(COLOURS);
        particle.drag = random(0.9, 0.99);
        theta = random(TWO_PI);
        force = random(2, 8);
        particle.vx = sin(theta) * force;
        particle.vy = cos(theta) * force;
        particles.push(particle);
    };
    demo.update = function () {
        let i, particle;
        for (i = particles.length - 1; i >= 0; i--) {
            particle = particles[i];
            if (particle.alive)
                particle.move();
            else
                pool.push(particles.splice(i, 1)[0]);
        }
    };
    demo.draw = function () {
        demo.globalCompositeOperation = 'lighter';
        for (let i = particles.length - 1; i >= 0; i--) {
            particles[i].draw(demo);
        }
    };
    demo.mousemove = function () {
        let touch, max, i, j, n;
        for (i = 0, n = demo.touches.length; i < n; i++) {
            touch = demo.touches[i], max = random(1, 4);
            for (j = 0; j < max; j++) {
                demo.spawn(touch.x, touch.y);
            }
        }
    };
</script>
</body>
</html>
