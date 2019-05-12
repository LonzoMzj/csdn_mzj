package cn.com.how.pojo;
/**
 * 分页实现类
 * @author admin
 *
 */
public class Page {
	int start =0;//起始位置
	public int eachPageCount=5;//每页数据
	int totalPage = 0;//总页数
	public String userName;
	public Integer userid; 
	public User user;
	private String fileName;
	private Integer fileId;
	private Integer topicId;
	
	public Integer getTopicId() {
		return topicId;
	}
	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getEachPageCount() {
		return eachPageCount;
	}
	public void setEachPageCount(int eachPageCount) {
		this.eachPageCount = eachPageCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStart() {
		return start;
	}
	public int getStart(int currentPage) {
		return (currentPage-1)*eachPageCount;
	}
	public void setStart(int start) {
		this.start = start;
	}

	public int  caltotalPage(int totalCount) {
		if(0==totalCount%eachPageCount) {
			return totalCount/eachPageCount;
		}else {
			return totalCount/eachPageCount+1;
		}
	}
	
}
