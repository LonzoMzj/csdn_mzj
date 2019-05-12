package cn.com.how.mapper;

import java.util.Date;
import java.util.List;

import cn.com.how.pojo.CollectFile;
import cn.com.how.pojo.FileComment;
import cn.com.how.pojo.FileResource;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;

public interface FileMapper {

	int addFile(FileResource fileResource);

	void addUploadScore(ScoreDetail scoreDetail);

	int queryFile();

	List<FileResource> queryFileList(Page page);

	int queryFileLike(Page page);

	List<FileResource> searchLike(Page page);

	List<FileResource> queryThisFile(Integer fileId);

	FileResource selectFileById(Integer fileId);

	void addDownloadCount(Integer fileId);

	List<FileComment> queryThisFileComment(Page page);

	int queryThisFileCommentCount(Integer fileId);

	int addFileComment(FileComment fileComment);

	int collectThisFile(Integer fileId, Integer userid);

	int queryIsCollect(Integer fileId, Integer userid);

	List<CollectFile> queryCollectFile(Page page);

	int queryCollectCount(Integer userid);

	int queryThisFileGrade(Integer fileId);

	FileResource selectId(byte[] bs, Integer userid);

	void addCommentZero(Integer fileId);

	List<FileResource> queryFileList2();

}
