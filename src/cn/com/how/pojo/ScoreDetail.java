package cn.com.how.pojo;

import java.util.Date;

/**
 * 积分消费明细
 * @author admin
 *
 */
public class ScoreDetail {

	private Integer id;//主键id
	private Integer userid;//用户id
	private Integer scoreCount;//积分
	private Date expendTime;//消费时间
	private Integer scoreSource;//积分来源,1注册2上传3评论4下载5发表
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getScoreCount() {
		return scoreCount;
	}
	public void setScoreCount(Integer scoreCount) {
		this.scoreCount = scoreCount;
	}
	public Date getExpendTime() {
		return expendTime;
	}
	public void setExpendTime(Date expendTime) {
		this.expendTime = expendTime;
	}
	public Integer getScoreSource() {
		return scoreSource;
	}
	public void setScoreSource(Integer scoreSource) {
		this.scoreSource = scoreSource;
	}
	
}
