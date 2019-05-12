package cn.com.how.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.com.how.pojo.CollectFile;
import cn.com.how.pojo.FileComment;
import cn.com.how.pojo.FileResource;
import cn.com.how.pojo.Msg;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;
import cn.com.how.pojo.User;
import cn.com.how.service.FileService;
import cn.com.how.service.ScoreDetailService;

@Controller
@RequestMapping("/file")
public class FileController {
 
	@Resource
	FileService fileService;
	@Resource
	ScoreDetailService scoreDetailService;
	
	/**
	 * 发表资源文件
	 * @param fileResource
	 * @param file
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/addFile")
	public String addFile(FileResource fileResource,MultipartFile file,
			HttpSession session,ScoreDetail scoreDetail) throws IOException {
		byte[] fileByte=file.getBytes();
		fileResource.setFiles(fileByte);
		fileResource.setFileSize(file.getSize());
		User user = (User)session.getAttribute("user");
		Integer userid = user.getUserid();
		fileResource.setUserid(userid);
		//执行上传
		int count = fileService.addFile(fileResource);
		//增加上传积分
		scoreDetail.setUserid(userid);
		fileService.addUploadScore(scoreDetail);
		//先查出文件的id,增加一条评分为0的文件资源评论记录
		FileResource f = fileService.selectId(fileResource.getFiles(),fileResource.getUserid());
		fileService.addCommentZero(f.getFileId());
		if(count>0) {
			return "forward:/index.jsp";
		}
		return "upload";
	}
	/**
	 * 首页一览
	 * @param session
	 * @param currentPage
	 * @param page
	 * @return
	 */
	@RequestMapping("/queryFile")
	@ResponseBody
	public Msg queryFile(HttpSession session,
			@RequestParam(value="currentPage",defaultValue="1") Integer currentPage,
			Page page) {
		//资源文件总记录
		int totalCount=fileService.queryFile();
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		//主页一览
		List<FileResource> fileResourceList = fileService.queryFileList(page);
		return Msg.success()
				.add("fileResourceList", fileResourceList)
				.add("totalCount", totalCount)
				.add("currentPage", currentPage)
				.add("totalPage", totalPage);
	}
	/***
	 * pageHelper分页查询
	 * @param currentPage
	 * @return
	 */
	@RequestMapping("/queryFile2")
	@ResponseBody
	public Msg queryFile2(@RequestParam(value="currentPage",defaultValue="1") Integer currentPage) {
		//设置每页显示2条
		PageHelper.startPage(currentPage,2);
		List<FileResource> fileResourceList = fileService.queryFileList2();
		PageInfo pageInfo = new PageInfo(fileResourceList,3);
		return Msg.success().add("pageInfo", pageInfo);
	}
	/**
	 * 首页模糊查询一览
	 * @param currentPage
	 * @param page
	 * @return
	 */
	@RequestMapping("/searchLike")
	@ResponseBody
	public Msg searchLike(@RequestParam(value="currentPage",defaultValue="1") Integer currentPage,
			Page page) {
		// 资源文件总记录
		int totalCount = fileService.queryFileLike(page);
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		//模糊搜索一览
		List<FileResource> fileResourceList = fileService.searchLike(page);
		return Msg.success()
				.add("fileResourceList", fileResourceList)
				.add("currentPage", currentPage)
				.add("totalCount", totalCount)
				.add("totalPage", totalPage);
	}
	/**
	 * 跳转至页面详情页面
	 * @param fileId
	 * @param request
	 * @return
	 */
	@RequestMapping("/fileDetail")
	public String fileDetail(Integer fileId,HttpServletRequest request) {
		request.setAttribute("fileId", fileId);
		return "detail";
	}
	/**
	 * 查询文件详情
	 * @param fileId
	 * @return
	 */
	@RequestMapping("/queryThisFile")
	@ResponseBody
	public Msg queryThisFile(Integer fileId) {
		//文件的详情
		List<FileResource> fileResourceList = fileService.queryThisFile(fileId);
		//查询文件资源平均分
		int avgGrade = fileService.queryThisFileGrade(fileId);
		return Msg.success()
				.add("fileResourceList", fileResourceList)
				.add("avgGrade", avgGrade);
	}
	/**
	 * 下载资源文件
	 * @param files
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/downloadThisFile")
	public ResponseEntity<byte[]> downLoadImg(Integer fileId,HttpSession session) throws UnsupportedEncodingException {
		//根据id查询文件本身
		FileResource fileResource  = fileService.selectFileById(fileId);
		byte[] fileByte = fileResource.getFiles();
		HttpHeaders headers = new HttpHeaders();
		//下载文件名如果有中文,浏览器会把中文用——代替.为了兼容浏览器的中文格式要将这里的
		//文件名转化为ISO-8859-1
		String fileName = new String(fileResource.getFileName().getBytes("UTF-8"),"ISO-8859-1");
		headers.setContentDispositionFormData("attachment",fileName+"."+fileResource.getFileType());
		ResponseEntity<byte[]> entity = new ResponseEntity<>(fileByte, headers, HttpStatus.OK);
		//执行下载操作,文件下载次数要加1,用户积分要减少
		fileService.addDownloadCount(fileId);
		User user = (User)session.getAttribute("user");
		//减少积分也是增加一条记录,积分为负值
		Integer score = -fileResource.getScore();
		scoreDetailService.reduceScore(user.getUserid(),score);
		//然后增加被下载用户的积分
		scoreDetailService.addOtherUserScore(fileResource.getUserid(),fileResource.getScore());
		return entity ;
	}
	/**
	 * 资源文件评论一览
	 * @param fileId
	 * @return
	 */
	@RequestMapping("/queryThisFileComment")
	@ResponseBody
	public Msg queryThisFileComment(
			@RequestParam(value="currentPage",defaultValue="1") Integer currentPage,
			Page page) {
		//查询该资源文件评论的总条数
		int totalCount = fileService.queryThisFileCommentCount(page.getFileId());
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		List<FileComment> fileCommetList = fileService.queryThisFileComment(page);
		return Msg.success()
				.add("fileCommetList", fileCommetList)
				.add("totalCount", totalCount)
				.add("totalPage", totalPage)
				.add("currentPage", currentPage);
	}

	/**
	 * 发表资源文件评论
	 * @param fileComment
	 * @return
	 */
	@RequestMapping("/addFileComment")
	@ResponseBody
	public Msg addFileComment(FileComment fileComment) {
		//System.out.println("userid:"+fileComment.getUserid());
		int count = fileService.addFileComment(fileComment);
		//发表评论成功之后增加用户积分
		scoreDetailService.addScoreFileComment(fileComment.getUserid());
		return Msg.success().add("count", count);
	}
	/**
	 * 收藏文件(session中用户，和fileId)
	 * @param fileId
	 * @param session
	 * @return
	 */
	@RequestMapping("/collectThisFile")
	@ResponseBody
	public Msg collectThisFile(Integer fileId,HttpSession session) {
		User user = (User)session.getAttribute("user");
		Integer userid = user.getUserid();
		//不允许重复收藏,所以先查询是否存在
		int r = fileService.queryIsCollect(fileId,userid);
		if(r>=1) {
			return Msg.success().add("count", r);
		//如果未有记录,则可以收藏,添加记录
		}else {
			int count = fileService.collectThisFile(fileId,userid);
			return Msg.success().add("count", count);
		}	
	}
	/**
	 * 查看我的收藏
	 * @return
	 */
	@RequestMapping("/queryCollectFile")
	@ResponseBody
	public Msg queryCollectFile(HttpSession session,Page page,
			@RequestParam(value="currentPage",defaultValue="1") Integer currentPage) {
		User user =(User)session.getAttribute("user");
		Integer userid = user.getUserid();
		//查看收藏的总记录数
		int totalCount = fileService.queryCollectCount(userid);
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		page.setUserid(userid);
		List<CollectFile> collectFileList = fileService.queryCollectFile(page);
		return Msg.success().add("collectFileList", collectFileList)
				.add("totalCount", totalCount)
				.add("totalPage", totalPage)
				.add("currentPage", currentPage);
	}
}
