//操作表单div
function FormDiv() {
	// 最前显示的窗口，默认undefined
	this._show;
	// 打开
	this.show = function(name) {
		var height = $(window).height();
		$(".hidden").css({
			'display' : 'block',
			'height' : height
		});
		$("." + name).css({
			'display' : 'block'
		});
		$("." + name + " .username")[0].focus();
		this._show = name;
	}
	// 隐藏
	this.hidden = function() {
		$(".hidden").css({
			'display' : 'none'
		})
		$(".formDiv").css({
			'display' : 'none'
		})
		$(".formDiv input").val("");
		$(".formDiv .msg").text("");
		$(".formDiv .eMsg").text("").css("display", "none");
		this._show = undefined;
	}
}

function Validator() {

	// 通用校验处理器
	this.verify = function(name, element) {
		switch (name) {
			case "username" :
				if (this.username(element.value, "#usernameMsg")) {
					hiddenMsg("#usernameMsg");
				}
				break;
			case "password" :
				if (this.password(element.value, "#passwordMsg")) {
					hiddenMsg("#passwordMsg");
				}
				break;
			case "repassword" :
				var password = $(element).siblings(".password").val();
				if (this.repassword(password, element.value, "#repasswordMsg")) {
					hiddenMsg("#repasswordMsg");
				}
				break;
			case "name" :
				if (this.name(element.value, "#nameMsg")) {
					hiddenMsg("#nameMsg");
				}
				break;
			case "email" :
				if (this.email(element.value, "#emailMsg")) {
					hiddenMsg("#emailMsg");
				}
				break;
			default :
				return "尚不支持的方法";
		}
	}

	// 登录表单前台校验
	this.loginForm = function() {
		var username = $("#login_username").val();
		var password = $("#login_password").val();
		return this.username(username, ".msg") && this.password(password, ".msg");
	}
	// 注册表单前台校验
	this.registForm = function() {
		var username = $("#regist_username").val();
		var password = $("#regist_password").val();
		var repassword = $("#regist_repassword").val();
		var name = $("#regist_name").val();
		var email = $("#regist_email").val();
		return this.username(username, "#usernameMsg") && this.password(password, "#passwordMsg")
				&& this.repassword(password, repassword, "#repasswordMsg") && this.name(name, "#nameMsg") && this.email(email, "#emailMsg");
	}

	// 校验用户名
	this.username = function(username, msgEle) {
		return required(username, "用户名不能为空!", msgEle) && length(username, 5, 10, "用户名长度应在5~10之间!", msgEle);
	};
	// 校验密码
	this.password = function(password, msgEle) {
		return required(password, "密码不能为空!", msgEle) && length(password, 5, 10, "密码长度应在5~10之间!", msgEle);
	};
	// 校验确认密码
	this.repassword = function(password, repassword, msgEle) {
		return required(repassword, "再次密码不能为空!", msgEle) && than(password, repassword, "两次输入的密码不一致!", msgEle);
	};
	// 校验昵称
	this.name = function(name, msgEle) {
		return required(name, "昵称不能为空!", msgEle) && length(name, 0, 10, "昵称长度不能超过10个字符!", msgEle);
	};
	// 校验email
	this.email = function(email, msgEle) {
		return required(email, "邮箱不能为空!", msgEle) && _email(email, "邮箱格式错误!", msgEle);
	};

	// 必须性校验
	var required = function(verifyValue, result, msgEle) {
		if (verifyValue == "") {
			msg(result, msgEle);
			return false;
		} else {
			return true;
		}
	}
	// 长度校验
	var length = function(verifyValue, min, max, result, msgEle) {
		if (verifyValue.length < min || verifyValue.length > max) {
			msg(result, msgEle);
			return false;
		} else {
			return true;
		}
	}
	// 相同性校验
	var than = function(verifyValue1, verifyValue2, result, msgEle) {
		if (verifyValue1 == verifyValue2) {
			return true;
		} else {
			msg(result, msgEle);
			return false;
		}
	}
	// email格式校验
	var _email = function(verifyValue, result, msgEle) {
		reg = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/gi;
		if (reg.test(verifyValue)) {
			return true;
		} else {
			msg(result, msgEle);
			return false;
		}
	}
}

// 信息提示
function msg(date, msgEle) {
	$(".formDiv " + msgEle).text(date);
	$(".formDiv " + msgEle).css("display", "block");
}

function hiddenMsg(name) {
	$(".formDiv " + name).text("");
	$(".formDiv " + name).css("display", "none");
}

function reflash() {
	location.reload(true);
}
function toTop() {
	$("html,body").animate({
		scrollTop : 0
	}, 'slow');
}
function toPost() {
	$("#post .title").focus();
}

function getUrl() {
	var pathname = window.location.pathname.substring(1);
	return window.location.protocol + "//" + window.location.host + "/" + pathname.substring(0, pathname.indexOf("/"));
}

function toAdmin() {
	if (user.login && user.isAdmin){
		$.post(getUrl() + "/admin/admin_toBackStage", {}, function(data) {
			if (!data || data == "") {
				alert("没有足够的权限");
				return;
			}
			window.location.href = data;
		})
	}else{
		formDiv.show("loginDiv");
	}
}
var user;
var formDiv = new FormDiv();
var validator = new Validator();

$(document).ready(function() {

	// 登录/注册开始
	// 打开
	$("#login").click(function() {
		formDiv.show("loginDiv");
	});
	$("#regist").click(function() {
		formDiv.show("registDiv");
	});
	// 关闭按钮
	$(".formDiv .top i").click(function() {
		formDiv.hidden();
	});
	// 键盘事件
	$(document).keydown(function(e) {
		if (e && formDiv._show && e.keyCode == 27) {// Esc
			formDiv.hidden();
		}
		if (e && formDiv._show && e.keyCode == 13) {// Enter
			var inputs = $("." + formDiv._show).find("input[type!='checkbox']");
			for (var i = 0; i < inputs.length; i++) {
				if (!inputs.eq(i).val() || inputs.eq(i).val() == "") {
					inputs.eq(i).focus();
					return;
				}
			}
			$("." + formDiv._show).find(".button").click();
		}
	});
	// 登录提交
	$("#login_submit").click(function() {
		if (validator.loginForm()) {
			$.post(getUrl() + "/user_login", $("#login_form").serialize(), function(data) {
				var value = JSON.parse(data);
				if (value.type == "success") {
					window.localStorage.setItem("user", JSON.stringify(value.user));
					window.sessionStorage.setItem("user", JSON.stringify(value.user));
					window.sessionStorage.setItem("date", JSON.stringify(value.date));
					reflash();
				} else {
					msg(value.error, ".msg");
				}
			})
		}
	})
	// 注册提交
	$("#regist_submit").click(function() {
		var usernameMsg = $("#usernameMsg").text();
		if ((usernameMsg == undefined || usernameMsg == "") && validator.registForm()) {
			$.post(getUrl() + "/user_regist", $("#regist_form").serialize(), function(data) {
				var value = JSON.parse(data);
				if (value.type == "success") {
					window.localStorage.setItem("user", JSON.stringify(value.user));
					window.sessionStorage.setItem("user", JSON.stringify(value.user));
					window.sessionStorage.setItem("date", JSON.stringify(value.date));
					reflash();
				} else {
					msg(value.error, ".msg");
				}
			})
			return;
		}
	})

	// 后台返回消息提示

	$(".formDiv .input").focus(function() {
		msg("", ".msg");
	})
	$(".registDiv .input").blur(function() {
		var name = $(this).attr("name");
		validator.verify(name, $(this)[0]);
	})

	// ajax校验用户名
	$("#regist_username").blur(function() {
		$.post(getUrl() + "/user_verifyUsernameAjax", {
			"username" : $("#regist_username").val()
		}, function(date) {
			var result = JSON.parse(date);
			if (result.type == "success") {
			} else {
				msg(result.error, "#usernameMsg");
			}
		})
	})
	// 登录/注册结束

	// 退出开始
	$("#exit").click(function() {
		$.post(getUrl() + "/user_exit", {}, function(date) {
			window.localStorage.removeItem("user");
			window.sessionStorage.removeItem("user");
			window.sessionStorage.removeItem("date");
			$(".unlogin").css("display", "block");
			$(".logined").css("display", "none");
			$(".message_div .user").css("display", "none");
			$(".message_div:last").css("display", "none");
			user = null;
		})
	})
	// 退出结束

	// 假登录
	if (window.localStorage.user) {
		user = JSON.parse(window.localStorage.user);
		user.login = false;
		if (window.sessionStorage.user) {
			user = JSON.parse(window.sessionStorage.user);
			var time = (new Date().getTime() - JSON.parse(window.sessionStorage.date).time) / 1000 / 60; // 已登录时间，30min后过期
			if (time > 30) {
				window.sessionStorage.removeItem("user");
				window.sessionStorage.removeItem("date");
			} else {
				user.login = true;
			}
		}

		$(".unlogin").css({
			"display" : "none"
		});
		$(".logined").css({
			"display" : "block"
		});
		$(".logined").eq(0).children("a").text("欢迎：" + user.name);
		var userDiv = $(".message_div .user").css("display", "block");
		userDiv.children("img").attr("src", getUrl() + "/image/" +  user.icon);
		userDiv.find(".user_name_a").text(user.username);
		userDiv.find(".user_property").eq(0).text(user.position.name);
		userDiv.find(".user_property").eq(1).text(user.level.lname);
		if (user.login && user.isAdmin)
			$(".message_div:last").css("display", "block");
	}
})

function toJSONDate(date){
	var obj = new Object();
	obj.date = date.getDate();
	obj.day = date.getDay();
	obj.hours = date.getHours();
	obj.minutes = date.getMinutes();
	obj.month = date.getMonth();
	obj.seconds = date.getSeconds();
	obj.time = date.getTime();
	obj.timezoneOffset = date.getTimezoneOffset();
	obj.year = date.getYear();
	return JSON.stringify(obj);
}