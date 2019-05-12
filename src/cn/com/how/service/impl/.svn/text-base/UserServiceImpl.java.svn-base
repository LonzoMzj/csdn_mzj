package cn.com.how.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.how.mapper.UserMapper;
import cn.com.how.pojo.User;
import cn.com.how.service.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Resource
	UserMapper userMapper;
	@Override
	public int regist(User user) {
		return userMapper.regist(user);
	}
	@Override
	public List<User> selectUser(String userName) {
		return userMapper.selectUser(userName);
	}
	@Override
	public void registScore(Integer userid,Date expendTime) {
		userMapper.registScore(userid,expendTime);
	}
	@Override
	public int findpassByTel(User user) {
		return userMapper.findpassByTel(user);
	}
	@Override
	public int findpassByEmail(User user) {
		return userMapper.findpassByEmail(user);
	}
	@Override
	public int login(User user) {
		return userMapper.login(user);
	}
	@Override
	public User selectHead(Integer userid) {
		return userMapper.selectHead(userid);
	}
	

}
