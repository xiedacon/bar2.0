if (window.sessionStorage.user) {
	var user = JSON.parse(window.sessionStorage.user);
	if (!user.isAdmin) {
		location.replace(getUrl() + "/index");
	}
} else {
	location.replace(getUrl() + "/index");
}

function getUrl() {
	var pathname = window.location.pathname.substring(1);
	return window.location.protocol + "//" + window.location.host + "/" + pathname.substring(0, pathname.indexOf("/"));
}

function loadLog(method, page, eleId, parse, attachEvent) {
	$.post(getUrl() + "/admin/" + method + "?page=" + page, {}, function(data) {
		var pageBean = JSON.parse(data);
		var ele = $("#" + eleId).css("display", "block");
		ele.siblings().css("display", "none");
		$("#css").attr("href", "../css/" + eleId + ".css");

		ele.find(".result-count").text(pageBean.totalCount);

		// 显示数据开始
		var tbody = ele.find("tbody");
		tbody.empty();

		for (var i = 0; i < pageBean.beanList.length; i++) {
			var bean = pageBean.beanList[i];
			parse(tbody, bean);
		}
		// 显示数据结束

		// 分页开始
		var pages = tbody.siblings("tfoot").find("#pages");

		pages.empty();

		if (pageBean.page > 1) {
			pages.append("<span class='fl page' data-page=" + 1 + ">首页</span>");
			pages.append("<span class='fl page' data-page=" + (pageBean.page - 1) + ">上一页</span>")
		}

		var begin = pageBean.page - 4;
		var end = pageBean.page + 5;
		if (pageBean.page < 5)
			begin = 1;
		if (pageBean.totalPage < 10 || pageBean.page + 5 > pageBean.totalPage) {
			end = pageBean.totalPage;
		} else if (pageBean.page < 5) {
			end = 10;
		}
		for (var i = begin; i <= end; i++) {
			pages.append(i == pageBean.page ? ("<span class='fl now_page page'>" + i + "</span>") : ("<span class='fl page' data-page='" + i
					+ "'>" + i + "</span>"));
		}

		if (pageBean.page < pageBean.totalPage) {
			pages.append("<span class='fl page' data-page=" + (pageBean.page + 1) + ">下一页</span>").append(
					"<span class='fl page' data-page=" + pageBean.totalPage + ">尾页</span>");
		}

		pages.find(".page").not(".now_page").click(function() {
			loadLog(method, $(this).attr("data-page"), eleId, parse, attachEvent);
		})

		var top = ele.find(".result-table").offset().top;
		var height = ele.find(".result-table").outerHeight();
		if (top + height > $(window).height()) {
			$('html, body').animate({
				scrollTop : ele.find(".result-table").offset().top
			}, 'slow');
		}
		// 分页结束

		attachEvent(ele);
	})
}

function toDeletePost() {
	var parse = function(tbody, postLog) {
		var tr = tbody.append("<tr id='" + postLog.id + "' class='post'></tr>") //
		.children("#" + postLog.id);
		tr.append("<td><input type='checkbox' /></td>") //
		.append("<td></td>") //
		.append("<td>" + postLog.lastOperator.name + "</td>") //
		.append(
				"<td>" + (postLog.lastTime.year + 1900) + "-" + (postLog.lastTime.month + 1) + "-" + postLog.lastTime.date + "<br/>"
						+ postLog.lastTime.hours + ":" + postLog.lastTime.minutes + "</td>") //
		.append("<td><a class='button recoverPost' href='#'>恢复帖子</a></td>");
		tr.children("td:eq(1)").append("<div class='content-top'></div>") //
		.append("<div class='content-bottom'></div>");
		var contentTop = tr.find(".content-top");
		contentTop.append("<a href='#' class='fl title'>" + postLog.post.title + "</a>") //
		.append(
				"<p class='fr'><a class='username'><i> </i>" + postLog.post.owner.name + "/a> <span class='date'>"
						+ (postLog.post.ldate.month + 1) + "月" + postLog.post.ldate.date + "日 " + postLog.post.ldate.hours + ":"
						+ postLog.post.ldate.minutes + "</span></p>");
		tr.find(".content-bottom").append("<div class='desc'><span class='desc_span fl'>" + postLog.post.content + "</span></div>");
	}
	var attachEvent = function(ele) {
		ele.find(".recoverPost").click(function(e) {
			var id = $(this).parents(".post").attr("id");
			size = 1;
			recoverPost(id, 1);
		})

		var flag = true;
		ele.find(".selectAll input").click(function() {
			if (flag) {
				ele.find("tbody input").prop({
					"checked" : true
				}).attr("checked", "checked");
				flag = false;
			} else {
				ele.find("tbody input").prop({
					"checked" : false
				}).removeAttr("checked");
				flag = true;
			}
		})
		ele.find("tbody input").click(function() {
			if ($(this).attr("checked")) {
				$(this).removeAttr("checked");
			} else {
				$(this).attr({
					"checked" : "checked"
				});
			}
		})
		ele.find(".recoverSelected").unbind().click(function() {
			var checkboxs = ele.find("tbody input[checked]");
			size = checkboxs.size();
			for (var i = 0; i < checkboxs.size(); i++) {
				recoverPost(checkboxs.eq(i).parents(".post").attr("id"), checkboxs.size());
			}
			$(this).parent().find("input").removeAttr("checked");
		})

		var num = 1;
		function recoverPost(id, count) {
			$.post(getUrl() + "/admin/postLog_recoverPost", {
				"id" : id
			}, function(data) {
				num++;
				if (num > count) {
					toDeletePost();
				}
			});
		}
	}

	loadLog("postLog_findUnRecoverDeleteLog", 1, "postDelete", parse, attachEvent);
}

function toPostLog() {
	var parse = function(tbody, postLog) {
		var tr = tbody.append("<tr id='" + postLog.id + "' class='post'></tr>") //
		.children("#" + postLog.id);
		tr.append("<td></td>") //
		.append("<td>" + (postLog.lastOperation == "delete" ? "删除" : "已恢复") + "</td>") //
		.append("<td>" + postLog.lastOperator.name + "</td>") //
		.append(
				"<td>" + (postLog.lastTime.year + 1900) + "-" + (postLog.lastTime.month + 1) + "-" + postLog.lastTime.date + "<br/>"
						+ (postLog.lastTime.hours) + ":" + (postLog.lastTime.minutes) + "</td>");
		var contentTop = tr.children("td:first").append("<div class='content-top'></div>") //
		.append("<div class='content-bottom'></div>") //
		.children(".content-top");
		contentTop.append("<a href='#' class='fl title'>" + postLog.post.title + "</a>") //
		.append("<p class='fr'></p>") //
		.children("p") //
		.append("<a class='username'><i></i>" + postLog.post.owner.name + "</a> ") //
		.append("<span class='date'>" + (postLog.post.ldate.month + 1) + "月" + (postLog.post.ldate.date) + "日</span>");
		var contentBottom = tr.find(".content-bottom");
		contentBottom.append("<div class='desc'></div>") //
		.children(".desc") //
		.append("<div class='desc_top'><span class='desc_span fl'>" + postLog.post.content + "</span></div>");
	}
	var attachEvent = function(ele) {
	}
	loadLog("postLog_findAllLog", 1, "postLog", parse, attachEvent);
}

function toUserList() {
	var parse = function(tbody, user) {
		var tr = tbody.append("<tr id='" + user.uid + "' class='post'></tr>") //
		.children("#" + user.uid);
		tr.append("<td class='user'></td>") //
		.append("<td>0</td>") //
		.append("<td>" + user.level.lid + "</td>") //
		.append("<td>" + user.postNum + "</td>") //
		.append("<td>" + user.boutiqueNum + "</td>") //
		.append(
				"<td>"
						+ (user.registDate == null ? "——" : ((user.registDate.year + 1900) + "-" + (user.registDate.month + 1) + "-"
								+ (user.registDate.date) + " " + (user.registDate.hours) + ":" + (user.registDate.minutes))) + "</td>") //
		.append("<td class='operation'></td>");
		tr.children(".user") //
		.append("<img class='user-icon' src='" + getUrl() + "/image/" + user.icon + "'>") //
		.append("<a href='#' class='username'>" + user.name + "</a>");
		tr.children(".operation") //
		.append("<a class='button forbiddenUser'>封禁</a>") //
		.append("<a class='button addToBlackList'>加入黑名单</a>");
	}
	var attachEvent = function(ele) {
		ele.find(".forbiddenUser").click(function() {
			var uid = $(this).parents(".post").attr("id");
			$.post(getUrl() + "/admin/userLog_forbiddenUser", {
				"uid" : uid
			}, function(data) {
				toUserList();

			});
			$('html, body').animate({
				scrollTop : $(this).parents(".result-table").offset().top
			}, 'slow');
		})
	}
	loadLog("user_findAllUser", 1, "userList", parse, attachEvent);
}

function toForbiddenList() {
	var parse = function(tbody, userLog) {
		var tr = tbody.append("<tr id='" + userLog.id + "' class='post'></tr>") //
		.children("#" + userLog.id);
		tr.append("<td><input type='checkbox'></td>") //
		.append("<td class='user'></td>") //
		.append("<td>...</td>") //
		.append(
				"<td>" + (userLog.lastTime.year + 1900) + "-" + (userLog.lastTime.month + 1) + "-" + (userLog.lastTime.date) + " "
						+ (userLog.lastTime.hours) + ":" + (userLog.lastTime.minutes) + "</td>") //
		.append("<td>" + userLog.lastOperator.name + "</td>") //
		.append("<td><a href='#' class='button removeForbiddenLog'>解除封禁</a></td>")
		tr.children(".user") //
		.append("<img class='user-icon' src='" + getUrl() + "/image/" + userLog.user.icon + "'>") //
		.append("<a href='#' class='username'>" + userLog.user.name + "</a>");
	}
	var attachEvent = function(ele) {
		ele.find(".removeForbiddenLog").click(function() {
			var id = $(this).parents(".post").attr("id");
			size = 1;
			removeForbiddenLog(id, 1);
		})
		var flag = true;
		ele.find(".selectAll input").click(function() {
			if (flag) {
				ele.find("tbody input").prop({
					"checked" : true
				}).attr("checked", "checked");
				flag = false;
			} else {
				ele.find("tbody input").prop({
					"checked" : false
				}).removeAttr("checked");
				flag = true;
			}
		})
		ele.find("tbody input").click(function() {
			if ($(this).attr("checked")) {
				$(this).removeAttr("checked");
			} else {
				$(this).attr({
					"checked" : "checked"
				});
			}
		})
		ele.find(".forbiddenSelected").unbind().click(function() {
			var checkboxs = ele.find("tbody input[checked]");
			var size = checkboxs.size();
			for (var i = 0; i < checkboxs.size(); i++) {
				removeForbiddenLog(checkboxs.eq(i).parents(".post").attr("id"), checkboxs.size());
			}
			$(this).parent().find("input").removeAttr("checked");
		})

		var num = 1;
		function removeForbiddenLog(id, count) {
			$.post(getUrl() + "/admin/userLog_removeForbiddenLog", {
				"id" : id
			}, function(data) {
				num++;
				if (num > count) {
					toForbiddenList();
				}
			});
		}
	}
	loadLog("userLog_findUnrecoverForbiddenLog", 1, "forbiddenList", parse, attachEvent);
}
function toUserLog() {
	var parse = function(tbody, userLog) {
		var tr = tbody.append("<tr id='" + userLog.id + "' class='post'></tr>") //
		.children("#" + userLog.id);
		var lastOperation;
		switch (userLog.lastOperation) {
			case "forbidden" :
				lastOperation = "封禁";
				break;
			case "removeForbidden" :
				lastOperation = "解除封禁";
				break;
			case "blackList" :
				lastOperation = "加入黑名单";
				break;
			case "removeBlackList" :
				lastOperation = "移除黑名单";
				break;
		}
		tr.append("<td class='user'></td>") //
		.append("<td>" + lastOperation + "</td>") //
		.append("<td>" + userLog.lastOperator.name + "</td>") //
		.append(
				"<td>" + (userLog.lastTime.year + 1900) + "-" + (userLog.lastTime.month + 1) + "-" + (userLog.lastTime.date)
						+ "&nbsp;&nbsp;&nbsp;" + (userLog.lastTime.hours) + ":" + (userLog.lastTime.minutes) + "</td>");
		tr.children(".user") //
		.append("<img class='user-icon' src='" + getUrl() + "/image/" + userLog.user.icon + "'>") //
		.append("<a href='#' class='username'>" + userLog.user.name + "</a>");
	}
	var attachEvent = function(ele) {
	}
	loadLog("userLog_findAllLog", 1, "userLog", parse, attachEvent);
}
var json;
function toAdminManage() {
	$.post(getUrl() + "/admin/adminLog_findAdminAll", {}, function(data) {
		json = JSON.parse(data);
		var positionList = json.positionList;
		var userMap = json.userMap;
		var ele = $("#adminManage").css("display", "block");
		ele.siblings().css("display", "none");

		var positionListEle = ele.find("#positions");
		var userMapEle = ele.find("#userMap");

		positionListEle.empty();
		userMapEle.empty();

		for (var i = 0; i < positionList.length; i++) {
			var position = positionList[i];
			if (position.id == 1)
				continue;

			positionListEle.append("<option value='" + position.id + "'>" + position.name + "</option>");

			var userListEle = userMapEle.append("<li id='" + position.id + "' class='list-li fl'></li>") //
			.children("#" + position.id);
			userListEle = userListEle.append("<span class='subtitle'><i></i>" + position.name + "</span>") //
			.append("<ul class='listItem'></ul>") //
			.children("ul");
			var userList = userMap[position.id];
			for (var j = 0; j < userList.length; j++) {
				var user = userList[j];
				userListEle.append("<li id='" + user.uid + "' class='listItem-li user'></li>") //
				.children("#" + user.uid) //
				.append("<a href='#' class='adminUser'>" + user.name + "</a>") //
				.append("<a href='#' class='delete removeAdmin'></a>");
			}
		}

		function addAdmin(id, username) {
			$.post(getUrl() + "/admin/adminLog_addAdmin", {
				"id" : id,
				"username" : username
			}, function(data) {
				toAdminManage();
			});
		}
		function removeAdmin(uid) {
			$.post(getUrl() + "/admin/adminLog_removeAdmin", {
				"uid" : uid
			}, function(data) {
				toAdminManage();
			});
		}
		ele.find("#addAdmin").click(function() {
			var id = $(this).siblings("select").val();
			var username = $(this).siblings("input").val();
			if (!username || username == "") {
				$(this).siblings("input").focus();
				return;
			}
			$(this).siblings("input").val("");
			addAdmin(id, username);
		})
		ele.find(".removeAdmin").click(function() {
			var uid = $(this).parents(".user").attr("id");
			removeAdmin(uid);
		})
	})
}
function toAdminLog() {
	var parse = function(tbody, adminLog) {
		var tr = tbody.append("<tr id='" + adminLog.id + "' class='post'></tr>") //
		.children("#" + adminLog.id);
		tr.append("<td class='user'></td>") //
		.append("<td>" + adminLog.operation + "</td>") //
		.append("<td>" + adminLog.operator.name + "</td>") //
		.append(
				"<td>" + (adminLog.time.year + 1900) + "-" + (adminLog.time.month + 1) + "-" + (adminLog.time.date) + "&nbsp;&nbsp;&nbsp;"
						+ (adminLog.time.hours) + ":" + (adminLog.time.minutes) + "</td>");
		tr.children(".user") //
		.append("<img class='user-icon' src='" + getUrl() + "/image/" + adminLog.adminUser.icon + "'>") //
		.append("<a href='#' class='username'>" + adminLog.adminUser.name + "</a>");
	}
	var attachEvent = function(ele) {
	}
	loadLog("adminLog_findAdminLog", 1, "adminLog", parse, attachEvent);
}