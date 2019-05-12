package cn.com.how.mapper;

import java.util.List;

import cn.com.how.pojo.Page;
import cn.com.how.pojo.ScoreDetail;

public interface ScoreDetailMapper {

	List<ScoreDetail> queryScoreDetail(Page page);

	int getCount(Integer userid);

	int getSum(Integer userid);

	void reduceScore(Integer userid, Integer score);

	void addScoreFileComment(Integer userid);

	void addOtherUserScore(Integer userid, Integer score);

	int getTypeCount(Integer userid, int i);

	int getShouCangCount(Integer userid);

	int getFatieCount(Integer userid);

}
