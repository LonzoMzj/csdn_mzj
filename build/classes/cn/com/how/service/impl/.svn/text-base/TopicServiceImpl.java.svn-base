package cn.com.how.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.how.mapper.TopicMapper;
import cn.com.how.pojo.Page;
import cn.com.how.pojo.Topic;
import cn.com.how.service.TopicService;
@Service
public class TopicServiceImpl implements TopicService {

	@Resource
	TopicMapper topicMapper;

	@Override
	public int queryCount() {
		return topicMapper.queryCount();
	}

	@Override
	public List<Topic> queryTopicList(Page page) {
		return topicMapper.queryTopicList(page);
	}

	@Override
	public Topic queryThisTopic(Integer id) {
		return topicMapper.queryThisTopic(id);
	}

	@Override
	public List<Topic> queryThisTopicComment(Page page) {
		return topicMapper.queryThisTopicComment(page);
	}

	@Override
	public int queryThisTopicCommentCount(Integer topicId) {
		return topicMapper.queryThisTopicCommentCount(topicId);
	}

	@Override
	public int addTopic(Topic topic) {
		return topicMapper.addTopic(topic);
	}

	@Override
	public void addTopicScore(Integer userid) {
		topicMapper.addTopicScore(userid);
	}

	@Override
	public int addTopicComment(Topic topic) {
		return topicMapper.addTopicComment(topic);
	}

	@Override
	public void addTopicCommentScore(Integer userid) {
		topicMapper.addTopicCommentScore(userid);
	}

	@Override
	public List<Topic> chakanComment(Integer topicId) {
		return topicMapper.chakanComment(topicId);
	}
}
