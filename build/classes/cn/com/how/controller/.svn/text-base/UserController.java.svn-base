package cn.com.how.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.com.how.pojo.User;
import cn.com.how.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	UserService userService;
	
	/**
	 * 用户注册
	 * @param user
	 * @param file
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("/regist")
	public String regist(User user,MultipartFile file,
			HttpServletRequest request) throws IllegalStateException, IOException {
    	byte[] fileByte=file.getBytes();
    	user.setHeadImage(fileByte);
    	int count = userService.regist(user);
    	System.out.println(count);
    	//注册成功
    	if(count>0) {
    		System.out.println(user.getUserName());
    		List<User> userList = userService.selectUser(user.getUserName());
    		System.out.println(userList.get(0).getUserid());
    		int userid =userList.get(0).getUserid();
    		Date expendTime = userList.get(0).getRegistTime();
    		//添加注册积分
    		userService.registScore(userid,expendTime);
    		return "redirect:/index.jsp";
    	}else {
    		return "redirect:/regist.jsp";
    	}
	}
	/**
	 * 根据电话找回密码
	 * @param user
	 * @return
	 */
	@RequestMapping("/findpassByTel")
	public String findpassByTel(User user) {
		int count = userService.findpassByTel(user);
		if(count>0) {
			return "redirect:/index.jsp";
		}
		return "redirect:/regist.jsp";
	}
	/**
	 * 根据邮箱找回密码
	 * @param user
	 * @return
	 */
	@RequestMapping("/findpassByEmail")
	public String findpassByEmail(User user) {
		int count =userService.findpassByEmail(user);
		if(count>0) {
			return "redirect:/index.jsp";
		}
		return "redirect:/regist.jsp";
	}
	/**
	 * 用户登录
	 * @param session
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpSession session,User user,HttpServletRequest request) {
		int count = userService.login(user);
		//如果登陆成功,跳转至一览页面
		if(count>0) {
			List<User> list = userService.selectUser(user.getUserName());
			System.out.println(list.get(0).getUserid());
			session.setAttribute("user", list.get(0));
			System.out.println(session.getAttribute("user").toString());
			return "forward:/index.jsp";
		//如果失败,返回错误信息
		}else {
			return "redirect:/index.jsp";
		}
	}
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/index.jsp";
	}

	/**
	 * 显示头像信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/showImg")
	public ResponseEntity<byte[]> downLoadImg(HttpSession session) {
		User user = (User)session.getAttribute("user");
		byte[] headImage = user.getHeadImage();
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(headImage, HttpStatus.OK);
		return entity ;
	}
	/***
	 * 显示每个评论资源用户的头像
	 * @param userid
	 * @return
	 */
	@RequestMapping("/showImgs")
	public ResponseEntity<byte[]> showImgs(Integer userid) {
		//通过id查询头像
		User user = userService.selectHead(userid);
		byte[] headImage = user.getHeadImage();
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(headImage, HttpStatus.OK);
		return entity ;
	}
	/**
	 * 用户详细信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/personal")
	public String personal(HttpSession session) {
		//User user = (User)session.getAttribute("user");
		return "personal";
	}
	/**
	 * 跳转页面通用方法
	 * @param toPage
	 * @return
	 */
	@RequestMapping("/toPage")
	public String toPage(String toPage) {
		return toPage;
	}
	/**
	 * 未登陆跳转至首页
	 * @return
	 */
	@RequestMapping("/toIndex")
	public String toIndex() {
		return "redirect:/index.jsp";
	}
}
