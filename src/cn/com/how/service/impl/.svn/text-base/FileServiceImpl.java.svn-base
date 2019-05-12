package cn.com.how.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.how.mapper.FileMapper;
import cn.com.how.pojo.CollectFile;
import cn.com.how.pojo.FileComment;
import cn.com.how.pojo.FileResource;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;
import cn.com.how.service.FileService;
@Service
public class FileServiceImpl implements FileService {

	@Resource
	FileMapper fileMapper;
	@Override
	public int addFile(FileResource fileResource) {
		return fileMapper.addFile(fileResource);
	}
	@Override
	public void addUploadScore(ScoreDetail scoreDetail) {
		fileMapper.addUploadScore(scoreDetail);
	}
	@Override
	public int queryFile() {
		return fileMapper.queryFile();
	}
	@Override
	public List<FileResource> queryFileList(Page page) {
		return fileMapper.queryFileList(page);
	}
	@Override
	public int queryFileLike(Page page) {
		return fileMapper.queryFileLike(page);
	}
	@Override
	public List<FileResource> searchLike(Page page) {
		return fileMapper.searchLike(page);
	}
	@Override
	public List<FileResource> queryThisFile(Integer fileId) {
		return fileMapper.queryThisFile(fileId);
	}
	@Override
	public FileResource selectFileById(Integer fileId) {
		return fileMapper.selectFileById(fileId);
	}
	@Override
	public void addDownloadCount(Integer fileId) {
		fileMapper.addDownloadCount(fileId);
	}
	@Override
	public List<FileComment> queryThisFileComment(Page page) {
		return fileMapper.queryThisFileComment(page);
	}
	@Override
	public int queryThisFileCommentCount(Integer fileId) {
		return fileMapper.queryThisFileCommentCount(fileId);
	}
	@Override
	public int addFileComment(FileComment fileComment) {
		return fileMapper.addFileComment(fileComment);
	}
	@Override
	public int collectThisFile(Integer fileId, Integer userid) {
		return fileMapper.collectThisFile(fileId,userid);
	}
	@Override
	public int queryIsCollect(Integer fileId, Integer userid) {
		return fileMapper.queryIsCollect(fileId,userid);
	}
	@Override
	public List<CollectFile> queryCollectFile(Page page) {
		return fileMapper.queryCollectFile(page);
	}
	@Override
	public int queryCollectCount(Integer userid) {
		return fileMapper.queryCollectCount(userid);
	}
	@Override
	public int queryThisFileGrade(Integer fileId) {
		return fileMapper.queryThisFileGrade(fileId);
	}
	@Override
	public FileResource selectId(byte[] bs, Integer userid) {
		return fileMapper.selectId(bs,userid);
	}
	@Override
	public void addCommentZero(Integer fileId) {
		 fileMapper.addCommentZero(fileId);
	}
	@Override
	public List<FileResource> queryFileList2() {
		return fileMapper.queryFileList2();
	}

}
