package cn.xiedacon.bar.adminLog.action;

public interface AdminLogAction {

	/**
	 * 查看所有吧务
	 * 
	 * @return
	 */
	void findAdminAll();

	/**
	 * 添加吧务
	 * 
	 * @return
	 */
	void addAdmin();

	/**
	 * 移除吧务
	 * 
	 * @return
	 */
	void removeAdmin();

	/**
	 * 查看所有吧务管理记录
	 * 
	 * @return
	 */
	void findAdminLog();

}
