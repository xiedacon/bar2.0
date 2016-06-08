package cn.xiedacon.bar.admin.action.impl;


import org.apache.struts2.ServletActionContext;

import cn.xiedacon.bar.admin.action.AdminAction;
import cn.xiedacon.bar.user.domain.User;
import cn.xiedacon.bar.util.AjaxUtils;
import cn.xiedacon.bar.util.PageBean;

public class AdminActionImpl implements AdminAction {

	// 变量区

	private PageBean<User> pageBean;

	public PageBean<User> getPageBean() {
		return pageBean;
	}

	// ///////////////////////////////////////////////////////////////////////

	// 私有方法区

	private User getAdmin() {
		User admin = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if (admin == null || !admin.isAdmin()) {
			throw new RuntimeException("未登录用户");
		}
		return admin;
	}

	// ///////////////////////////////////////////////////////////////////////

	// 公共方法区

	@Override
	public void toBackStage() {
		getAdmin();
		AjaxUtils.sendString(ServletActionContext.getRequest().getContextPath() + "/admin/index");
	}

	@Override
	public String toStage() {
		return "index";
	}

}
