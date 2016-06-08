package cn.xiedacon.bar.postLog.domain;

import java.util.Date;
import java.util.Set;

import cn.xiedacon.bar.post.domain.Post;
import cn.xiedacon.bar.user.domain.User;

/**
 * 帖子申诉记录实体类
 * 
 * CREATE TABLE `postlog` ( `firstOperation` VARCHAR(255) DEFAULT NULL,
 * `firstOperator` INT(11) DEFAULT NULL, `firstTime` DATETIME DEFAULT NULL,
 * `lastOperation` VARCHAR(255) DEFAULT NULL, `lastOperator` INT(11) DEFAULT
 * NULL, `lastTime` DATETIME DEFAULT NULL, `id` INT(11) NOT NULL, `pid`
 * VARCHAR(255) DEFAULT NULL, `appealUser` INT(11) DEFAULT NULL, `appealTime`
 * DATETIME DEFAULT NULL, `appealProcess` TINYINT(1) DEFAULT NULL,
 * `appealContent` TEXT, PRIMARY KEY (`id`), KEY
 * `FK_postlog_firstOperator_TO_user` (`firstOperator`), KEY
 * `FK_postlog_lastOperator_TO_user` (`lastOperator`), KEY `FK_postlog_TOpost`
 * (`pid`), KEY `FK_postlog_appealUser_TO_user` (`appealUser`), CONSTRAINT
 * `FK_postlog_appealUser_TO_user` FOREIGN KEY (`appealUser`) REFERENCES `user`
 * (`uid`), CONSTRAINT `FK_postlog_firstOperator_TO_user` FOREIGN KEY
 * (`firstOperator`) REFERENCES `user` (`uid`), CONSTRAINT
 * `FK_postlog_lastOperator_TO_user` FOREIGN KEY (`lastOperator`) REFERENCES
 * `user` (`uid`), CONSTRAINT `FK_postlog_TOpost` FOREIGN KEY (`pid`) REFERENCES
 * `post` (`pid`) ) ENGINE=INNODB DEFAULT CHARSET=utf8
 * 
 * @author xieda
 * 
 */
public class PostAppealLog {

	private User appealUser;
	private Date appealTime;
	private Boolean appealProcess;
	private String appealContent;
	private Integer id;
	private Post post;
	private String firstOperation;
	private User firstOperator;
	private Date firstTime;
	private String lastOperation;
	private User lastOperator;
	private Date lastTime;
	private Set<PostOperationLog> postOperationLogs;

	public Set<PostOperationLog> getPostOperationLogs() {
		return postOperationLogs;
	}

	public void setPostOperationLogs(Set<PostOperationLog> postOperationLogs) {
		this.postOperationLogs = postOperationLogs;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstOperation() {
		return firstOperation;
	}

	public void setFirstOperation(String firstOperation) {
		this.firstOperation = firstOperation;
	}

	public User getFirstOperator() {
		return firstOperator;
	}

	public void setFirstOperator(User firstOperator) {
		this.firstOperator = firstOperator;
	}

	public Date getFirstTime() {
		return firstTime;
	}

	public void setFirstTime(Date firstTime) {
		this.firstTime = firstTime;
	}

	public String getLastOperation() {
		return lastOperation;
	}

	public void setLastOperation(String lastOperation) {
		this.lastOperation = lastOperation;
	}

	public User getLastOperator() {
		return lastOperator;
	}

	public void setLastOperator(User lastOperator) {
		this.lastOperator = lastOperator;
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public User getAppealUser() {
		return appealUser;
	}

	public void setAppealUser(User appealUser) {
		this.appealUser = appealUser;
	}

	public Date getAppealTime() {
		return appealTime;
	}

	public void setAppealTime(Date appealTime) {
		this.appealTime = appealTime;
	}

	public Boolean getAppealProcess() {
		return appealProcess;
	}

	public void setAppealProcess(Boolean appealProcess) {
		this.appealProcess = appealProcess;
	}

	public String getAppealContent() {
		return appealContent;
	}

	public void setAppealContent(String appealContent) {
		this.appealContent = appealContent;
	}

}
