package cn.com.how.service;

import java.util.List;

import cn.com.how.pojo.Page;
import cn.com.how.pojo.Topic;

public interface TopicService {

	public int queryCount();

	public List<Topic> queryTopicList(Page page);

	public Topic queryThisTopic(Integer id);

	public List<Topic> queryThisTopicComment(Page page);

	public int queryThisTopicCommentCount(Integer topicId);

	public int addTopic(Topic topic);

	public void addTopicScore(Integer userid);

	public int addTopicComment(Topic topic);

	public void addTopicCommentScore(Integer userid);

	public List<Topic> chakanComment(Integer topicId);

}
