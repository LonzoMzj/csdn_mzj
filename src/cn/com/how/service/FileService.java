package cn.com.how.service;

import java.util.Date;
import java.util.List;

import cn.com.how.pojo.CollectFile;
import cn.com.how.pojo.FileComment;
import cn.com.how.pojo.FileResource;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;

public interface FileService {

	public int addFile(FileResource fileResource);

	public void addUploadScore(ScoreDetail scoreDetail);

	public int queryFile();

	public List<FileResource> queryFileList(Page page);

	public int queryFileLike(Page page);

	public List<FileResource> searchLike(Page page);

	public List<FileResource> queryThisFile(Integer fileId);

	public FileResource selectFileById(Integer fileId);

	public void addDownloadCount(Integer fileId);

	public List<FileComment> queryThisFileComment(Page page);

	public int queryThisFileCommentCount(Integer fileId);

	public int addFileComment(FileComment fileComment);

	public int collectThisFile(Integer fileId, Integer userid);

	public int queryIsCollect(Integer fileId, Integer userid);

	public List<CollectFile> queryCollectFile(Page page);

	public int queryCollectCount(Integer userid);

	public int queryThisFileGrade(Integer fileId);

	public FileResource selectId(byte[] bs, Integer userid);

	public void addCommentZero(Integer fileId);

	public List<FileResource> queryFileList2();

}
