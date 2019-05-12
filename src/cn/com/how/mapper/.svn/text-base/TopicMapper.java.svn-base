package cn.com.how.mapper;

import java.util.List;

import cn.com.how.pojo.Page;
import cn.com.how.pojo.Topic;

public interface TopicMapper {

	int queryCount();

	List<Topic> queryTopicList(Page page);

	Topic queryThisTopic(Integer id);

	List<Topic> queryThisTopicComment(Page page);

	int queryThisTopicCommentCount(Integer topicId);

	int addTopic(Topic topic);

	void addTopicScore(Integer userid);

	int addTopicComment(Topic topic);

	void addTopicCommentScore(Integer userid);

	List<Topic> chakanComment(Integer topicId);

}
