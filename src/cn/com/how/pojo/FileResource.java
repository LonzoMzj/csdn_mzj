package cn.com.how.pojo;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 上传的文件资源
 * @author admin
 *
 */
public class FileResource {

	private Integer fileId; //文件id
	private String fileName;//文件名
	private byte[] files;//文件
	private String fileType;//文件类型
	private String keyWord;//关键字
	private Integer score;//所需积分
	private Integer downloadCount;//下载次数
	private Date uploadDate;//上传日期
	private Integer fileGrade;//文件评分
	private Long fileSize;//文件大小
	private String introduction;//文件介绍
	private Integer userid;//用户id
	private User user;//一个文件对应一个发布者
	private List<CollectFile> collectFileList;//一个文件可以对应多个收藏记录
	private List<User> userList;
	
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public List<CollectFile> getCollectFileList() {
		return collectFileList;
	}
	public void setCollectFileList(List<CollectFile> collectFileList) {
		this.collectFileList = collectFileList;
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
	public byte[] getFiles() {
		return files;
	}
	public void setFiles(byte[] files) {
		this.files = files;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(Integer downloadCount) {
		this.downloadCount = downloadCount;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public Integer getFileGrade() {
		return fileGrade;
	}
	public void setFileGrade(Integer fileGrade) {
		this.fileGrade = fileGrade;
	}
	
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	@Override
	public String toString() {
		return "FileResource [fileId=" + fileId + ", fileName=" + fileName + ", files=" + Arrays.toString(files)
				+ ", fileType=" + fileType + ", keyWord=" + keyWord + ", score=" + score + ", downloadCount="
				+ downloadCount + ", uploadDate=" + uploadDate + ", fileGrade=" + fileGrade + ", fileSize=" + fileSize
				+ ", introduction=" + introduction + "]";
	}
	
}
