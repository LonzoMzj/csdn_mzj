package cn.com.how.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.how.pojo.Msg;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.Topic;
import cn.com.how.pojo.User;
import cn.com.how.service.TopicService;

@Controller
@RequestMapping("/topic")
public class TopicController {
	
	@Resource
	TopicService topicService;
	/**
	 * 论坛首页一览
	 * @param session
	 * @param currentPage
	 * @param page
	 * @return
	 */
	@RequestMapping("/queryTopic")
	@ResponseBody
	public Msg queryTopic(HttpSession session,
			@RequestParam(value="currentPage",defaultValue="1") Integer currentPage,
			Page page) {
		//先要查询帖子总数
		int totalCount = topicService.queryCount();
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		List<Topic> topicList = topicService.queryTopicList(page);
		return Msg.success()
				.add("topicList", topicList)
				.add("totalCount", totalCount)
				.add("totalPage", totalPage)
				.add("currentPage", currentPage);
	}

	/**
	 * 跳转至详情页面
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/topicDetail")
	public String topicDetail(Integer id,HttpServletRequest request) {
		request.setAttribute("id", id);
		return "topicDetail";
	}
	/**
	 * 查询帖子详情页面上方的帖子内容
	 * @return
	 */
	@RequestMapping("/queryThisTopic")
	@ResponseBody
	public Msg queryThisTopic(Integer id) {
		Topic topic = topicService.queryThisTopic(id);
		return Msg.success().add("topic", topic);
	}
	/**
	 * 查询帖子详情页面上方的帖子   的评论内容
	 * @param currentPage
	 * @param page
	 * @param topicId
	 * @return
	 */
	@RequestMapping("/queryThisTopicComment")
	@ResponseBody
	public Msg queryThisTopicComment(@RequestParam(value="currentPage",defaultValue="1") Integer currentPage,
			Page page) {
		//查询该帖子的评论总数
		int totalCount = topicService.queryThisTopicCommentCount(page.getTopicId());
		//一览
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		List<Topic> topicList = topicService.queryThisTopicComment(page);
		return Msg.success().add("topicList", topicList)
				.add("totalCount", totalCount)
				.add("totalPage", totalPage)
				.add("currentPage", currentPage);
	}
	/**
	 * 发表帖子
	 * @param topic
	 * @return
	 */
	@RequestMapping("/addTopic")
	@ResponseBody
	public Msg addTopic(Topic topic,HttpSession session) {
		User user = (User)session.getAttribute("user");
		//session中id就是发帖人(评论人)的id
		topic.setFromId(user.getUserid());
		int count = topicService.addTopic(topic);
		//发表成功,增加积分
		topicService.addTopicScore(user.getUserid());
		return Msg.success().add("count", count);
	}
	/**
	 * 回复帖子
	 * @return
	 */
	@RequestMapping("/addTopicComment")
	@ResponseBody
	public Msg addTopicComment(Topic topic,HttpSession session) {
		User user = (User)session.getAttribute("user");
		//session中id就是发帖人(评论人)的id
		topic.setFromId(user.getUserid());
		int count = topicService.addTopicComment(topic);
		//评论帖子,增加积分
		topicService.addTopicCommentScore(user.getUserid());
		return Msg.success().add("count", count);
	}
	/**
	 * 回复评论
	 * @return
	 */
	@RequestMapping("/addCommentComment")
	@ResponseBody
	public Msg addCommentComment(Topic topic,HttpSession session) {
		User user = (User)session.getAttribute("user");
		//session中id就是发帖人(评论人)的id
		topic.setFromId(user.getUserid());
		int count = topicService.addTopicComment(topic);
		//评论帖子,增加积分
		topicService.addTopicCommentScore(user.getUserid());
		return Msg.success().add("count", count);
	}
	/**
	 * 查看评论的评论
	 * @param topicId
	 * @return
	 */
	@RequestMapping("/chakanComment")
	@ResponseBody
	public Msg chakanComment(Integer topicId) {
		List<Topic> topicList = topicService.chakanComment(topicId);
		return Msg.success().add("topicList", topicList);
	}
}
