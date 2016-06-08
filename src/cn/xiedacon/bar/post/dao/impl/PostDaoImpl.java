package cn.xiedacon.bar.post.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.xiedacon.bar.post.dao.PostDao;
import cn.xiedacon.bar.post.domain.Post;
import cn.xiedacon.bar.util.PageHibernateCallback;

/**
 * 帖子DAO层
 * 
 * @author xieda
 * 
 */
public class PostDaoImpl extends HibernateDaoSupport implements PostDao {

	@SuppressWarnings("unchecked")
	@Override
	public Integer findTotalCount() {
		String hql = "SELECT COUNT(*) FROM Post p WHERE p.status <> 2";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		if (list == null) {
			return 0;
		} else {
			return list.get(0).intValue();
		}
	}

	@Override
	public Post findByPid(String pid) {
		Post post = this.getHibernateTemplate().get(Post.class, pid);
		if (post == null || post.getStatus() == 2) {
			return null;
		} else {
			return post;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Integer findTotalCountByStatus(Integer sid) {
		String hql = "SELECT COUNT(p) FROM Post p WHERE p.status=?";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql, sid);
		if (list == null) {
			return 0;
		} else {
			return list.get(0).intValue();
		}
	}

	@Override
	public void createPost(Post post) {
		this.getHibernateTemplate().save(post);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> findByOuidAndStatus(Integer uid, Integer status) {
		String hql = "FROM Post p WHERE p.ouid=? AND p.status=? ORDER BY p.ldate DESC";
		List<Post> postList = (List<Post>) this.getHibernateTemplate().find(hql, uid, status);
		if (postList == null) {
			return new ArrayList<Post>();
		} else {
			return postList;
		}
	}

	@Override
	public List<Post> findByStatusABeginALimit(Integer status, int begin, int limit) {
		String hql = "SELECT p FROM Post p WHERE p.status=? ORDER BY p.ldate DESC";
		List<Post> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Post>(hql, status, begin, limit));
		if (list == null) {
			return new ArrayList<Post>();
		} else {
			return list;
		}
	}

	@Override
	public List<Post> findByBeginAndLimit(int begin, int limit) {
		String hql = "FROM Post p WHERE p.status <> 2 ORDER BY p.ldate DESC";
		List<Post> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Post>(hql, begin, limit));
		if (list == null) {
			return new ArrayList<Post>();
		} else {
			return list;
		}
	}
}
