// 加载内容
var textResolver = new TextResolver();
function loadMaterial(name, method, page, flag) {
	window.sessionStorage.date = toJSONDate(new Date());
	
	var method1 = window.location.search;
	if (method1 == "" || method1 == "?" + method) {
		window.history.replaceState({}, 0, "index?" + method);
	} else {
		window.history.pushState({}, 0, "index?" + method);
	}
	$.post(getUrl() + "/" + method + "?page=" + page, {}, function(data) {
		var pageBean = JSON.parse(data);
		var beanList = pageBean.beanList;

		var posts = $("#_posts");
		posts.empty();

		posts.siblings().remove(".nav");
		if (method == "post_boutique") {
			posts.parent().prepend("<ul class='nav'></ul>");
			var nav = posts.siblings(".nav");
			nav.append("<li class='nav_li'><span class='nav_element'>全部</span></li>").append(
					"<li class='nav_li'><a href='#' class='nav_element'>师傅好</a></li>");
		}

		for (var i = 0; i < pageBean.beanList.length; i++) {
			var post = posts.append("<li id=" + beanList[i].pid + " class='post'></li>").children("#" + beanList[i].pid);
			post.append("<div class='post_top'></div>").append("<div class='post_bottom'></div>");

			var top = post.children(".post_top");
			top.append("<div class='num fl'></div>").append("<div class='title fl'></div>").append("<div class='user fr'></div>");
			top.children(".num").append("<span class='num_span'>" + beanList[i].num + "</span>")
			top.children(".title").append(
					"<a target='_blank' href=" + getUrl() + "/post_toPost?post.pid=" + beanList[i].pid + " class='title_a' title="
							+ beanList[i].title + ">" + beanList[i].title + " </a>")
			top.children(".user").append("<a href='' class='user_a'>" + beanList[i].owner.name + "</a>").append("<img src=''>");

			var bottom = post.children(".post_bottom");
			bottom = bottom.append("<div class='desc'></div>").children(".desc");
			var user = bottom.append("<div class='user fr'></div>").children(".user");
			user.append("<a href='#' class='user_a fl'>" + beanList[i].lastUser.name + "</a> ").append(
					"<span class='user_span fr' title='最后回复时间'>" + beanList[i].ldate.hours + ":" + beanList[i].ldate.minutes + "</span>");

			var content = beanList[i].content;
			var span = bottom.append("<span class='desc_span fl'></span>").children(".desc_span")[0];
			textResolver.resolve(content, span);

		}

		var pages = $("#pages");
		pages.empty();

		if (pageBean.page > 1) {
			pages.append("<li class='fl page_first page_div' data-page=" + 1 + ">首页</li>");
			pages.append("<li class='fl page_previous page_div' data-page=" + (pageBean.page - 1) + ">上一页</li>")
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
			pages.append(i == pageBean.page
					? ("<li class='fl page_now'>" + i + "</li>")
					: ("<li class='fl page_div' data-page='" + i + "'>" + i + "</li>"));
		}

		if (pageBean.page != pageBean.totalPage) {
			pages.append("<li class='fl page_next page_div' data-page=" + (pageBean.page + 1) + ">下一页</li>").append(
					"<li class='fl page_end page_div' data-page=" + pageBean.totalPage + ">尾页</li>");
		}

		pages.find("li").click(function() {
			loadMaterial("posts", "post_findByPage", $(this).attr("data-page"));
		})

		posts.siblings(".posts_bottom").find(".postNum").text(pageBean.totalCount);

	});
	$("#" + name).siblings().removeClass("opt");
	$("#" + name).addClass('opt');
	if (!flag) {
		$('html, body').animate({
			scrollTop : $("body > .top").height() + $(".head").height()
		}, 'slow');
	}
}

function TextResolver() {
	this.resolve = function(text, ele) {
		var span = $(ele);
		var content = text;
		var images = new Array();
		var content1 = findImages(content, images);
		// 将富文本转换为文本
		content1 = span.html(content1).text();
		// 设置文本最长显示长度
		if (content1.length > 35) {
			span.text(content1.substring(0, 35) + "...")
		}
		if (images.length > 0) {
			var imagesBox = span.parents(".desc").append("<div class='desc_bottom'></div>").find(".desc_bottom");
			// 对图片进行调整
			// 数量
			if (images.length > 3) {
				images = new Array(images[0], images[1], images[2]);
			}
			// 将图片添加至指定位置
			imagesBox.html(images);
			// 尺寸
			for (var j = 0; j < imagesBox.children().size(); j++) {
				changeImage(imagesBox.children()[j]);
			}
		}
	}
	// 查找富文本中的所有图片
	var findImages = function(content, images) {
		var begin = content.indexOf("<img");
		if (begin < 0) {
			return content;
		}
		var content1 = content.substring(begin);
		var end = content1.indexOf(">") + 1;
		var image = content1.substring(0, end);
		images[images.length] = image;
		content1 = content.substring(0, begin) + content1.substring(end);
		return findImages(content1, images);
	}
	// 使图片适应尺寸
	var changeImage = function(image) {
		var height = $(image).height();
		var width = $(image).width();
		var ratio = 90 / height;
		$(image).height(90);
		$(image).width(width * ratio);
	}
}
