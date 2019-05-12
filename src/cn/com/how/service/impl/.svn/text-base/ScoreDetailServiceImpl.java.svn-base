package cn.com.how.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.how.mapper.ScoreDetailMapper;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;
import cn.com.how.service.ScoreDetailService;
@Service
public class ScoreDetailServiceImpl implements ScoreDetailService {

	@Resource
	ScoreDetailMapper scoreDetailMapper;

	@Override
	public List<ScoreDetail> queryScoreDetail(Page page) {
		return scoreDetailMapper.queryScoreDetail(page);
	}

	@Override
	public int getCount(Integer userid) {
		return scoreDetailMapper.getCount(userid);
	}

	@Override
	public int getSum(Integer userid) {
		return scoreDetailMapper.getSum(userid);
	}

	@Override
	public void reduceScore(Integer userid,Integer score) {
		scoreDetailMapper.reduceScore(userid,score);
	}

	@Override
	public void addScoreFileComment(Integer userid) {
		scoreDetailMapper.addScoreFileComment(userid);
	}

	@Override
	public void addOtherUserScore(Integer userid, Integer score) {
		scoreDetailMapper.addOtherUserScore(userid,score);
	}

	@Override
	public int getTypeCount(Integer userid, int i) {
		return scoreDetailMapper.getTypeCount(userid,i);
	}

	@Override
	public int getShouCangCount(Integer userid) {
		return scoreDetailMapper.getShouCangCount(userid);
	}

	@Override
	public int getFatieCount(Integer userid) {
		return scoreDetailMapper.getFatieCount(userid);
	}
	
}
