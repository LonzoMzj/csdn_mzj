package cn.com.how.pojo;

import java.util.Date;

/**
 * 收藏文件的实体bean
 * @author admin
 *
 */
public class CollectFile {

	private Integer id;//主键id
	private Integer userid;//用户id
	private Integer fileId;//文件id
	private Date collectTime;//收藏时间
	private User user;
	private FileResource fileResource;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public FileResource getFileResource() {
		return fileResource;
	}
	public void setFileResource(FileResource fileResource) {
		this.fileResource = fileResource;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public Date getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(Date collectTime) {
		this.collectTime = collectTime;
	}
	
}
