!
    function(t) {
        function e(e, a) {
            var o = this;
            return o.that = e,
                o.time = null,
                o.timer = null,
                o.timerScroll,
                o.oMark = null,
                o.oMark2 = null,
                o.oWrap = null,
                o.oWrapHd = null,
                o.oWrapFt = null,
                o.oWrapContent = null,
                o.oWrapContentImg = null,
                o.aImg = null,
                o.aImgLen = null,
                o.nPage = 0,
                o.nH = null,
                o.oPopPrev = null,
                o.win = t(window),
                o.isFixedPos = a.isFixedPos ? a.isFixedPos: !1,
                o.isIe6 = !1,
            a.id || (a.id = LT.getRandom()),
                o.that.data("dialog", a.id),
                o.sings = 'data-dialog="' + o.that.data("dialog") + '"',
                o.tempMark = '<iframe frameborder="no" class="pop_mark_ifrmae" ' + o.sings + " ></iframe>",
                o.tempMark2 = '<div class="pop_mark" ' + o.sings + "></div>",
                this.init = function(t) {
                    var e = this;
                    LT.temp.falls = !1,
                        e.nH = e.win.scrollTop(),
                    t.time && (e.time = 1e3 * t.time),
                        this.setType(t),
                        this.setContent(t),
                        this.bindEvent(t),
                    "function" == typeof t.showAfter && t.showAfter.call(e),
                    e.time && (e.timer = setTimeout(function() {
                            e.hide()
                        },
                        e.time))
                },
                this.init(a),
                this
        }
        var a = {
            type: null,
            title: null,
            height: null,
            width: null,
            className: "h38 w120",
            id: null,
            mark: !0,
            content: null,
            coord2: {
                x: null,
                y: null
            },
            btnshow: !0,
            btnText: ["??????", "??????"],
            time: null,
            showAfter: null,
            drag: !1,
            callback: null,
            close_callback: null,
            isFixedPos: !1
        };
        e.prototype = {
            constructor: e,
            setType: function(e) {
                var a = this;
                switch (t("body").append(a.tempMark).append(a.tempMark2), a.oMark = t(".pop_mark_ifrmae[" + a.sings + "]"), a.oMark2 = t(".pop_mark[" + a.sings + "]"), e.type.toLowerCase()) {
                    case "alert":

                        var o = '<div class="J_pop pop" id="' + e.id + '" ' + a.sings + '><div class="pop_hd"><span class="pop_close"></span><span class="pop_title f18"></span></div><div class="pop_bd"></div><div class="pop_ft"><a class="btnCom1 btnBg2 btnH1 inline pop_confirm ' + e.className + '" href="javascript:void(0)"><span>' + e.btnText[0] + "</span></a></div></div>";
                        t("body").append(o);
                        break;
                    case "confirm":
                        var i = '<div class="J_pop pop" id="' + e.id + '" ' + a.sings + '><div class="pop_hd"><span class="pop_close"></span><span class="pop_title f18"></span></div><div class="pop_bd"></div><div class="pop_ft"><a class="btnCom1 btnBg2 btnH1 inline pop_confirm ' + e.className + '" href="javascript:void(0)"><span>' + e.btnText[0] + '</span></a>&nbsp;&nbsp;<a class="btnCom1 btnBg4 btnH1 inline pop_cancel ' + e.className + '" href="javascript:void(0)"><span>' + e.btnText[1] + "</span></a></div></div>";
                        t("body").append(i);
                        break;
                    case "image":
                        var n = '<div class="J_pop pop" id="' + e.id + '" ' + a.sings + '><div class="pop_hd"><span class="pop_close">??????</span></div><div class="pop_bd"><span class="pop_prev">?????????</span><span class="pop_next">?????????</span><div class="pop_img"><div></div></div>';
                        t("body").append(n);
                        break;
                    default:
                        var n = '<div class="J_pop pop" id="' + e.id + '" ' + a.sings + '><div class="pop_hd"><span class="pop_close">??????</span></div><div class="pop_bd"></div></div>';
                        t("body").append(n)
                }
            },
            setContent: function(e) {
                var a = this;
                this.id = a.oWrap = t(".J_pop[" + a.sings + "]"),
                    a.oWrap.css({
                        zIndex: 1e4
                    }),
                    a.oWrapContent = a.oWrap.children(".pop_bd"),
                    a.oWrapHd = a.oWrap.children(".pop_hd"),
                    a.oWrapFt = a.oWrap.children(".pop_ft"),
                    oWrapTitle = a.oWrap.find("span.pop_title"),
                e.title && oWrapTitle.length > 0 && oWrapTitle.html(e.title),
                    a.oWrapContentImg = a.oWrapContent.children(".pop_img"),
                    a.oWrapContentImg.length > 0 ? (a.aImg = e.content, a.aImgLen = a.aImg.length, e.height = a.aImg[a.nPage].height, e.width = a.aImg[a.nPage].width, a.oWrapContentImg.html('<img src="' + a.aImg[a.nPage].src + '" width="' + e.width + '" height="' + e.height + '"  />').css({
                        height: e.height,
                        width: e.width
                    })) : (a.oWrapContent.html(e.content), a.oWrapContent.css({
                        height: e.height
                    }), a.oWrap.css({
                        width: e.width
                    }));
                var o = a.oWrap.children(".pop_ft"); ! e.btnshow && o.length > 0 && o.remove(),
                    a.coord(e),
                    a.show(e)
            },
            setSize: function() {},
            show: function(e) {
                var a = this;
                if (e.mark) if (t(".pop_mark").length > 1) {
                    var o = !0;
                    a.oPopPrev = t(".J_pop").filter(function() {
                        return t(this).attr("data-dialog") == e.id && (o = !1),
                            o ? !0 : void 0
                    }),
                        a.oPopPrev = a.oPopPrev.eq(a.oPopPrev.length - 1); {
                        a.oPopPrev.outerHeight(!0),
                            a.oPopPrev.outerWidth(!0),
                            a.oPopPrev.css("top"),
                            a.oPopPrev.css("left")
                    }
                } else a.oMark.css({
                    height: t(document).height() + "px",
                    width: a.win.width() + "px"
                }),
                    a.oMark2.css({
                        height: t(document).height() + "px"
                    });
                else a.oMark.hide(),
                    a.oMark2.hide();
                a.setPos(e, !1),
                    a.oWrap.show()
            },
            coord: function() {
                var t = this,
                    e = LT.fixed(t.oWrap, t.win);
                t.oWrap.css({
                    top: e.y,
                    left: e.x
                })
            },
            hide: function() {
                var t = this;
                t.time && (clearTimeout(t.timer), t.timer = null),
                t.oMark.length > 0 && t.oMark.remove(),
                t.oMark2.length > 0 && t.oMark2.remove(),
                    t.oWrap.remove(),
                    LT.temp.falls = !0
            },
            setPos: function(t, e) {
                var a = this;
                a.oWrap.height() > a.win.height() || a.isIe6 || a.isFixedPos && e ? (a.oWrap.css({
                    position: "absolute"
                }), a.coord(t)) : a.oWrap.css({
                    position: "fixed"
                })
            },
            bindEvent: function(e) {
                var a = this;

                e.drag ? a.oWrap.bind("mousedown",
                    function(e) {
                        t(e.target).is("textarea") || t(e.target).is("input") || LT.drag(e, {
                            that: t(this),
                            direction: "xy"
                        })
                    }) : a.oWrap.delegate(".pop_hd", "mousedown",
                    function(t) {
                        LT.drag(t, {
                            that: a.oWrap,
                            direction: "xy",
                            scopeEle: a.win
                        }),
                            t.preventDefault()
                    }),
                    a.oWrap.delegate(".pop_close", "click",
                        function(t) {
                            a.hide(),
                                a.oWrap.undelegate(".pop_close", "click"),
                                a.oWrap.undelegate(".pop_cancel", "click"),
                                a.oWrap.undelegate(".pop_confirm", "click"),
                            e.close_callback && "function" == typeof e.close_callback && e.close_callback.call(this),
                                t.stopPropagation(),
                                t.preventDefault()
                        }),
                    a.oWrap.delegate(".pop_cancel", "click", {
                            data: !1
                        },
                        function(t) {
                            var o;
                            "function" == typeof e.callback && (o = e.callback.call(a, t.data.data)),
                            o || a.hide(),
                                a.oWrap.undelegate(".pop_close", "click"),
                                a.oWrap.undelegate(".pop_cancel", "click"),
                                a.oWrap.undelegate(".pop_confirm", "click"),
                                t.stopPropagation(),
                                t.preventDefault()
                        }),
                    a.oWrap.delegate(".pop_confirm", "click", {
                            data: !0
                        },
                        function(t) {
                            var o;
                            "function" == typeof e.callback && (o = e.callback.call(a, t.data.data)),
                            o || (a.hide(), a.oWrap.undelegate(".pop_close", "click"), a.oWrap.undelegate(".pop_cancel", "click"), a.oWrap.undelegate(".pop_confirm", "click")),
                                t.stopPropagation(),
                                t.preventDefault()
                        }),
                    a.oWrap.delegate(".pop_prev", "click",
                        function(t) {
                            return a.nPage--,
                                a.nPage < 0 ? void(a.nPage = 0) : (e.height = a.aImg[a.nPage].height, e.width = a.aImg[a.nPage].width, a.oWrapContentImg.html('<img src="' + a.aImg[a.nPage].src + '" width="' + e.width + '" height="' + e.height + '"  />').css({
                                    height: e.height,
                                    width: e.width
                                }), a.coord(e), t.stopPropagation(), void t.preventDefault())
                        }),
                    a.oWrap.delegate(".pop_next", "click",
                        function(t) {
                            return a.nPage++,
                                a.nPage > a.aImgLen - 1 ? void(a.nPage = a.aImgLen - 1) : (e.height = a.aImg[a.nPage].height, e.width = a.aImg[a.nPage].width, a.oWrapContentImg.html('<img src="' + a.aImg[a.nPage].src + '" width="' + e.width + '" height="' + e.height + '"  />').css({
                                    height: e.height,
                                    width: e.width
                                }), a.coord(e), t.stopPropagation(), void t.preventDefault())
                        }),
                    a.win.bind({
                        resize: function() {
                            if (a.setPos(e, !0), a.coord(e), a.oPopPrev) {
                                var t = a.oPopPrev.css("top"),
                                    o = a.oPopPrev.css("left");
                                a.oMark.css({
                                    top: t,
                                    left: o
                                }),
                                    a.oMark2.css({
                                        top: t,
                                        left: o
                                    })
                            }
                        },
                        scroll: function() {
                            a.timerScroll && window.clearTimeout(a.timerScroll),
                                a.timerScroll = window.setTimeout(function() {
                                        a.setPos(e, !0)
                                    },
                                    100)
                        }
                    })
            }
        },
            t.fn.dialogFn = function(o) {
                var i = this.data("DialogFn");
                if (! (t(this).length < 0)) {
                    o = t.extend({},
                        a, o);
                    var n = [];
                    return this.each(function() {
                        i = new e(t(this), o),
                            t(this).data("DialogFn", i),
                            n.push(i)
                    }),
                        n
                }
            }
    } (jQuery),
    LT.namespace("LT.alertSamll"),
    LT.alertSmall = function(t, e, a) {
        a || (a = {}),
        a.btnText || (a.btnText = ["??????", "??????"]),
        a.width || (a.width = 364),
        void 0 == a.close_callback && (a.close_callback = null),
            $(document).dialogFn({
                title: "??????",
                type: "alert",
                width: a.width,
                btnText: a.btnText,
                className: "w60 mg_l5",
                content: "<div class='pd20'>" + t + "</div>",
                callback: e,
                close_callback: a.close_callback
            })
    },
    LT.namespace("LT.alertSamllBBS"),
    LT.alertSamllBBS = function(t, e, a) {
        a || (a = {}),
        a.btnText || (a.btnText = ["??????", "??????"]),
        a.width || (a.width = 364),
        void 0 == a.close_callback && (a.close_callback = null),
            $(document).dialogFn({
                title: "??????",
                type: "alert",
                width: a.width,
                btnText: a.btnText,
                className: "w60 mg_l5",
                content: "<div class='pd20' style='color:#fff'>" + t + "</div>",
                callback: e,
                close_callback: a.close_callback
            })
    },
    LT.namespace("LT.confirmSamll"),
    LT.confirmSmall = function(t, e) {
        $(document).dialogFn({
            title: "??????",
            type: "confirm",
            width: 364,
            className: "w60 mg_l5",
            content: "<div class='pd20'>" + t + "</div>",
            callback: e
        })
    },
    LT.namespace("LT.confirmSamllSelf"),
    LT.confirmSamllSelf = function(t, e, a) {
        a || (a = {}),
        a.btnText || (a.btnText = ["??????", "??????"]),
        a.title || (a.title = "??????"),
            $(document).dialogFn({
                title: a.title,
                type: "confirm",
                width: 364,
                btnText: a.btnText,
                className: "w60 mg_l5",
                content: "<div class='pd20'>" + t + "</div>",
                callback: e
            })
    },
    LT.namespace("LT.confirmSamllBBS"),
    LT.confirmSmallBBS = function(t, e) {
        $(document).dialogFn({
            title: "??????",
            type: "confirm",
            width: 364,
            className: "w60 mg_l5",
            content: "<div class='pd20'  style='color:#fff'>" + t + "</div>",
            callback: e
        })
    };