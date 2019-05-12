package cn.com.how.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.how.pojo.Msg;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;
import cn.com.how.pojo.User;
import cn.com.how.service.ScoreDetailService;
@Controller
@RequestMapping("/scoreDetail")
public class ScoreDetailController {

	@Resource
	ScoreDetailService scoreDetailService;
	/**
	 * 查询积分明细
	 * @return
	 */
	@RequestMapping("/queryScoreDetail")
	@ResponseBody
	public Msg queryScoreDetail(HttpSession session,
			@RequestParam(value="currentPage",defaultValue="1") Integer currentPage,
			Page page) {
		User user = (User)session.getAttribute("user");
		//查询总记录
		int totalCount=scoreDetailService.getCount(user.getUserid());
		//查询总积分
		int sumScore = scoreDetailService.getSum(user.getUserid());
		int totalPage = page.caltotalPage(totalCount);
		int start = page.getStart(currentPage);
		page.setStart(start);
		page.setUserid(user.getUserid());
		List<ScoreDetail> scoreDetailList = scoreDetailService.queryScoreDetail(page);
		return Msg.success()
				.add("scoreDetailList", scoreDetailList)
				.add("currentPage", currentPage)
				.add("totalCount", totalCount)
				.add("totalPage", totalPage)
				.add("sumScore", sumScore);
	}
	/**
	 * 查总积分
	 * @param session
	 * @return
	 */
	@RequestMapping("/querySum")
	@ResponseBody
	public Msg querySum(HttpSession session) {
		User user = (User)session.getAttribute("user");
	   //查询总积分
	   int sumScore = scoreDetailService.getSum(user.getUserid());
	   //查询收藏数
	   int shoucangCount = scoreDetailService.getShouCangCount(user.getUserid());
	   //查询发帖数
	   int fatieCount = scoreDetailService.getFatieCount(user.getUserid());
	   return Msg.success().add("sumScore", sumScore)
			   .add("shoucangCount", shoucangCount)
			   .add("fatieCount", fatieCount);
	}
	/**
	 * 查询积分占比
	 * @return
	 */
	@RequestMapping("/queryForHighCharts")
	@ResponseBody
	public Msg queryForHighCharts(HttpSession session) {
		User user = (User)session.getAttribute("user");
		//查询个人的总条数
		int totalCount=scoreDetailService.getCount(user.getUserid());
		//查询各个消费类型的占比
		int type1 = scoreDetailService.getTypeCount(user.getUserid(),1);
		int type2 = scoreDetailService.getTypeCount(user.getUserid(),2);
		int type3 = scoreDetailService.getTypeCount(user.getUserid(),3);
		int type4 = scoreDetailService.getTypeCount(user.getUserid(),4);
		int type5 = scoreDetailService.getTypeCount(user.getUserid(),5);
		float r1 = (float)type1/totalCount;
		float r2 = (float)type2/totalCount;
		float r3 = (float)type3/totalCount;
		float r4 = (float)type4/totalCount;
		float r5 = (float)type5/totalCount;
		return Msg.success()
				.add("r1", r1)
				.add("r2", r2)
				.add("r3", r3)
				.add("r4", r4)
				.add("r5", r5);
	}
}
