package cn.com.how.pojo;

import java.util.HashMap;
import java.util.Map;
/**
 * ajax返回通用类
 * @author admin
 *
 */
public class Msg {
	
	private int code;//代码
	private String msg;//错误信息
	private Map<String,Object> extend = new HashMap<String,Object>();//返回的数据
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功");
		return result;
	}
	public static Msg fail() {
		Msg result = new  Msg();
		result.setCode(200);
		result.setMsg("处理失败");
		return result;
	}
	public Msg add(String key,Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	

}
