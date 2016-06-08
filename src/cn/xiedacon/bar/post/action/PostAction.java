package cn.xiedacon.bar.post.action;

public interface PostAction {

	/**
	 * 分页查询帖子
	 * 
	 * @return
	 */
	void findByPage();

	/**
	 * 查询精品贴
	 * 
	 * @return
	 */
	void boutique();

	/**
	 * 加载帖子
	 * 
	 * @return
	 */
	void findByPidAndPage();

	/**
	 * 创建帖子
	 * 
	 * @return
	 */
	String createPost();

	/**
	 * 查询已删除帖子
	 */
	void findDeletePosts();
	
	String toPost();
}
