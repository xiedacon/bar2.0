function loadReplies() {
	// 多次ajax请求获取reply，得到后进行相关操作
	var size = $(".loadMsg").length;
	for (var i = 0; i < size; i++) {
		var fid = $(".loadMsg").parents(".floor").eq(i).attr("id");
		loadReply(fid, 1, true);
	}
}
function loadReply(fid, page, firstFlag) {
	window.sessionStorage.date = toJSONDate(new Date());
	
	$.post(getUrl() + "/reply_findByFidAndPage", {
		"fid" : fid,
		"page" : page
	}, function(data) {
		// 无数据：清除loadMsg
		// 有数据：清除childs_top以外的所有子元素，将数据解析为dom元素添加到childs下
		var json = eval("(" + data + ")");
		if (firstFlag && json.beanList == "") {
			$("#" + fid).find(".loadMsg").remove();
		} else { // 将获得的json解析为DOM
			var childs = $("#" + fid).find(".childs");
			if (firstFlag) { // 创建回复的父元素
				childs.children().not(".childs_top").remove();
				childs.append("<div class='childs_middle'><ul></ul><div>").append("<div class='childs_bottom'></div>");
				var span = "<span class='num fl'>";
				if (json.totalCount > 10) {
					span += "还有" + (json.totalCount-5) + "条回复，<span class='show'>点击查看</span>";
				}
				span += " </span> <span class='myidea fr'>我也说一句</span>";
				childs.find(".childs_bottom").append(span).append(
						"<div class='idea'><textarea class='idea_text'></textarea><span class='idea_button createReply'>发表</span></div>");
				childs.find(".reply").removeClass('top_right_button_close').text('收起回复').attr("data-num",json.totalCount).parent().css({
					"border-width" : '1px'
				});
				// 绑定事件
				childs.find(".myidea").click(function(event) {
					$(this).siblings('.idea').slideToggle(0).find(".idea_text").text("").focus();
				});
				childs.find(".createReply").click(function() {
					createReply($(this)[0])
				});
			} else { // 清空回复的父元素
				childs.find(".childs_middle ul").empty();
			}
			// 每一个回复开始
			for (var i = 0; i < json.beanList.length; i++) {
				var reply = json.beanList[i];
				childs.find(".childs_middle ul").append("<li id='reply_" + reply.rid + "' class='child'></li>");
				childs.find("#reply_" + reply.rid).append("<div class='child_left fl'></div>").append("<div class='child_right'></div>");
				childs.find("#reply_" + reply.rid + " .child_left").append(
						"<img class='child_left_img' src='" + getUrl() + "/image/" + reply.owner.icon + "'>");
				childs.find("#reply_" + reply.rid + " .child_right").append(
						"<a href='#' class='child_user'>" + reply.owner.name + "</a> <span>" + reply.content + "</span>").append(
						"<div class='date'><span class='date_span'> </span> <span class='date_a'>回复</span></div>");
			}
			// 每一个回复结束
			// 绑定回复相关事件
			if (firstFlag) {
				if (json.totalCount > 10) {
					var child = childs.find(".child").slice(5);
					childs.find(".childs_middle ul").append("<li><ul class='hiddenChilds' style='display:none;'></ul></li>");
					childs.find(".hiddenChilds").append(child);
					childs.find(".show").click(function(e) {
						$(this).parents(".childs").find(".hiddenChilds").slideDown(500);
						var pageBox = $(this).parent();
						pageBox.empty();
						appendPages(pageBox[0], json);
					})
				} else {
				}
			} else {
				var pageBox = childs.find(".num");
				pageBox.empty();
				appendPages(pageBox[0], json);
				$("html,body").scrollTop($("#" + fid + " .childs").offset().top);
			}
			$(".date_a").click(function(event) {
				var name = $(this).parents(".child_right").find(".child_user").text();
				$(this).parents(".childs").find('.idea').slideDown(0);
				$(this).parents(".childs").find('.idea_text').text("回复 " + name + ":").focus();
			});
		}
	})
}

function appendPages(element, json) {
	var pageBox = $(element);
	var page = json.page;
	if (page != 1) {
		pageBox.append("<span id='1' class='num_page fl'>首页</span>");
		pageBox.append("<span id='" + (page - 1) + "' class='num_page fl'>上一页</span>");
	}
	var begin = page - 4;
	var end = page + 5;
	// 修正begin
	if (page < 5) {
		begin = 1;
	}
	// 修正end
	if (json.totalPage < 10) {
		end = json.totalPage;
	} else if (page < 5) {
		end = 10;
	} else {
		end = json.totalPage;
	}
	for (var i = begin; i < end + 1; i++) {
		if (i == page) {
			pageBox.append("<span class='now_page fl'>" + i + "</span>");
		} else {
			pageBox.append("<span id='" + i + "' class='num_page fl'>" + i + "</span>");
		}
	}
	if (page != json.totalPage) {
		pageBox.append("<span id='" + (page + 1) + "' class='num_page fl'>下一页</span>");
		pageBox.append("<span id='" + json.totalPage + "' class='num_page fl'>尾页</span>");
	}
	pageBox.children().not(".now_page").click(function() {
		var fid = $(this).parents(".floor").attr("id");
		var page = $(this).attr("id");
		loadReply(fid, page);
	})
}
function loadMaterial(name, method, page) {
	window.location.href = getUrl() + "/index?" + method;
}

var pid;
function loadPost(page) {
	window.sessionStorage.date = toJSONDate(new Date());
	
	pid = window.location.search.replace("?post.pid=","");
	
	$.post(getUrl() + "/post_findByPidAndPage?post.pid=" + pid + "&page=" + page, {}, function(data) {
		var post = JSON.parse(data);
		var pageBean = post.pageBean;

		var topPages = $("#top_pages");
		var bottomPages = $("#bottom_pages");
		topPages.empty();
		bottomPages.empty();

		// 分页部分开始
		if (pageBean.page > 1) {
			topPages.append("<span class='top_page fl' data-page=" + 1 + ">首页</span>");
			topPages.append("<span class='top_page fl' data-page=" + (pageBean.page - 1) + ">上一页</span>");
			bottomPages.append("<span class='bottom_page fl' data-page=" + 1 + ">首页</span>");
			bottomPages.append("<span class='bottom_page fl' data-page=" + (pageBean.page - 1) + ">上一页</span>");
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
			topPages.append(i == pageBean.page // 
			? ("<span class='now_page fl'>" + i + "</span>") // 
			: ("<span class='top_page fl' data-page='" + i + "'>" + i + "</span>"));
			bottomPages.append(i == pageBean.page //
			? ("<span class='now_page fl'>" + i + "</span>") //
			: ("<span class='bottom_page fl' data-page='" + i + "'>" + i + "</span>"));
		}

		if (pageBean.page != pageBean.totalPage) {
			topPages.append("<span class='top_page fl' data-page=" + (pageBean.page + 1) + ">下一页</span>") //
			.append("<span class='top_page fl' data-page=" + pageBean.totalPage + ">尾页</span>");
			bottomPages.append("<span class='bottom_page fl' data-page=" + (pageBean.page + 1) + ">下一页</span>") //
			.append("<span class='bottom_page fl' data-page=" + pageBean.totalPage + ">尾页</span>");
		}

		var topSpan = topPages.append("<span class='top_span fl'></span>") //
		.children(".top_span");
		topSpan.append("<span class='top_num'>" + pageBean.totalCount + "</span>回复贴，共") //
		.append("<span class='totalPage top_num'>" + pageBean.totalPage + "</span>页，跳到") //
		.append("<input type='text' class='page span_text' />页") //
		.append("<span class='span_button'>确定</span> ");
		var bottomSpan = bottomPages.append("<span class='top_span fl'></span>") //
		.children(".top_span");
		bottomSpan.append("<span class='top_num'>" + pageBean.totalCount + "</span>回复贴，共") //
		.append("<span class='totalPage top_num'>" + pageBean.totalPage + "</span>页，跳到") //
		.append("<input type='text' class='page span_text' />页") //
		.append("<span class='span_button'>确定</span> ");

		topPages.find("span").click(function() {
			if ($(this).hasClass("top_page"))
				loadPost($(this).attr("data-page"));
		})
		bottomPages.find("span").click(function() {
			if ($(this).hasClass("bottom_page"))
				loadPost($(this).attr("data-page"));
		})
		$(".span_button").click(function() {
			var page = $(this).siblings(".page").val();
			var totalPage = $(this).siblings(".totalPage").text();
			if (page == "" || page > totalPage) {
				return;
			} else {
				loadPost(page);
			}
		})
		// 分页部分结束

		topPages.siblings("#deletePost") //
		.attr("href", getUrl() + "/admin/postLog_deletePost?pid=" + pid);
		topPages.siblings(".return") //
		.attr("href", getUrl() + "/index?post_findByPage");
		bottomPages.siblings(".return") //
		.attr("href", getUrl() + "/index?post_findByPage");
		
		// 楼层开始
		var floors = $("#floors");
		floors.empty();
		
		var beanList = pageBean.beanList;
		for (var i = 0; i < beanList.length; i++) {
			var floor = beanList[i];
			var floorEle = floors.append("<div id='" + floor.fid + "' class='floor'></div>") //
			.children("#" + floor.fid);

			floor.floorNum == 1 ? floorEle.addClass("first_floor") : "";

			floorEle.append("<div class='user fl'></div>") //
			.append("<div class='floor_right fr'></div>");

			var user = floorEle.children(".user");
			floor.owner.uid == post.owner.uid ? user.append("<s class='host_icon'></s>") : "";
			user.append("<div class='user_img'></div>") //
			.append("<div class='user_name'></div>") //
			.append("<div class='honour'></div>") //
			.append("<div class='title'></div>");
			user.children(".user_img") //
			.append("<img class='user_img_img' src='" + getUrl() + "/image/" + floor.owner.icon + " />");
			user.children(".user_name") //
			.append("<a href='#' class='user_name_a'>" + floor.owner.name + " </a>");
			user.children(".honour") //
			.append("<img class='honour_icon fl' src=image/icons/1.png /><img class='honour_icon fl' src=image/icons/1.png />");
			user.children(".title") //
			.append("<span class='title_span fl'>" + floor.owner.level.lname + " </span> <img class='title_img fr' src=image/icons/1.png />");

			var floorRight = floorEle.children(".floor_right");
			floorRight.append("<div class='content'>" + floor.content + "</div>") //
			.append("<div class='childs'></div>");
			var childs = floorRight.children(".childs");

			var childsTop = childs.append("<div class='childs_top' style='border: 0px;'></div>") // \
			.children(".childs_top");
			childsTop.append("<span class='top_right_button_close fr top_right_button main_reply'>回复</span>") //
			.append("<div class='top_left fr'></div>") //
			.children(".top_left") //
			.append("<span class='top_left_span'>" + floor.floorNum + "楼</span>") //
			.append(
					"<span class='top_left_span'>" + (1900 + floor.date.year) + "-" + (floor.date.month + 1) + "-" + (floor.date.date)
							+ "</span>");

			if (floor.floorNum != 1) {
				childsTop.removeAttr("style") //
				.children("span") //
				.removeClass("main_reply") //
				.addClass("reply");
				childs.append("<div class='loadMsg' style='text-align: center; height: 50px; line-height: 50px;'>正在加载中。。</div>") //
				.append("<div class='childs_bottom' style='display: none'></div>") //
				.children(".childs_bottom") //
				.append("<div class='idea' style='padding-top: 10px; display: block;'></div>") //
				.children(".idea") //
				.append("<textarea class='idea_text'></textarea>") //
				.append("<span class='idea_button createReply'>发表</span>");
			}
			
			
		}

		$(".first_floor").find('.floor_right').css({
			'min-height' : $(".first_floor").find('.user').height(),
		});
		$(".reply").click(function(event) {
			var floor_right = $(this).parents('.floor_right');
			floor_right.css({
				'min-height' : floor_right.siblings('.user').height(),
			});
			var temp = $(this);
			if (temp.hasClass('top_right_button_close')) {
				$(this).removeClass('top_right_button_close').text('收起回复').parent().siblings().slideDown(300);
				temp.parent().css({
					"border-width" : '1px',
				});
				$(this).parents(".floor").find(".idea_text").text("").focus();
			} else {
				$(this).parent().siblings().slideUp(300, function() {
					temp.parent().css({
						"border-width" : '0px',
					});
					var size = temp.attr("data-num");
					if (size == 0) {
						temp.addClass('top_right_button_close').text('回复');
					} else {
						temp.addClass('top_right_button_close').text('回复（' + size + "）");
					}
				});
			}
		});
		$(".createReply").click(function() {
			createReply($(this)[0]);
		})
		$(".main_reply").click(function(event) {
			toReply()
		});
		// 楼层结束

		var floorsTop = floors.siblings(".floors_top");
		floorsTop.children("#pid").text(post.pid);
		floorsTop.children("h2").text(post.title);

		$("html,body").animate({
			scrollTop : $(".main_material").offset().top
		}, 'slow');
		
		loadReplies();
	})
}
$(document).ready(function(e) {
	// 导航栏开始
	$("#posts").click(function() {
		loadMaterial("posts", "post_findByPage", 1);
	})
	$("#picture").click(function() {
		alert("暂未加入该功能");
	})
	$("#boutique").click(function() {
		loadMaterial("boutique", "post_boutique", 1);
	})
	$("#group").click(function() {
		alert("暂未加入该功能");
	})
	// 导航栏结束
	$(".administrativePosts-div").hover(function() {
		$(".administrativePosts").stop().slideToggle(500);
	}, function() {
		$(".administrativePosts").stop().slideToggle(500);
	});

	loadPost(1);

})